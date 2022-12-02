//
//  ContentView.swift
//  TrackBikeTabBar
//
//  Created by Thierry Lebeau on 27/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView{
            acceuil()
                    .tabItem{
                    Image(systemName: "house")
                    Text("Accueil")
                }
            vitesseView()
                .tabItem {
                    Image(systemName: "speedometer")
                    Text("Vitesse")
                }
            tpsautourView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Tps au tour")
                }
            braquetView()
                .tabItem {
                    Image(systemName: "transmission")
                    Text("Braquet")
                }
            poursuiteView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("tps poursuite")
                }
            chronoView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Chrono")
                }
            historiqueView()
                .tabItem {
                    Image(systemName: "record.circle")
                    Text("Historique des chronos")
                }
                
        }.accentColor(.red)
    }
}
//...............................ACCUEIL........................
struct acceuil: View {
    var body: some View {
        ZStack{
            Image("ElectronPro2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.top)
               
            VStack(spacing:0){
                Spacer()
                ZStack{
                    Color(.gray)
                        .frame(height: 200)
                        .opacity(0.8)
                    Text("Bienvenue dans mon application dédiée à la piste")
                        .fontWeight(.bold)
                        .frame(width: 300)
                        .foregroundColor(.white)
                        .font(.title.italic())
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}
//....................................................................VITESSE.................................
struct vitesseView: View {
    @State var secondesSelection = 18
    @State var dixiemesSelection = 0
    @State var pisteSelection = 250

    let secondes = Array(10..<60)
    let dixiemes = Array(0..<10)
    let longueurPiste = [200, 250, 500]

    // Create computed variable that calculates the speed (in km/h)
    var vitesseCalculee: Double {
        let tempsTour = Double(secondesSelection) + (Double(dixiemesSelection) / 10)
        return (Double(pisteSelection) / 1000) / (tempsTour / 3600)
    }

    // Nicely format that speed (rounding to 3 s.f.)
    var formattedVitesseCalculee: String {
        "\(vitesseCalculee.formatted(.number.precision(.significantDigits(3)))) km/h"
    }
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.black, .red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
            VStack{
                Spacer()
                Text("Longueur de la piste")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)

                Picker("Longueur de la piste", selection: $pisteSelection) {
                    ForEach(longueurPiste, id: \.self) {
                        Text("\($0) m")
                    
                    }
                }

                .pickerStyle(.segmented)
                Spacer()

                Text("Temps au tour")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)

                HStack( spacing : 120.0) {
                   
                    Text("Secondes")
                    Text("Dixièmes")
                 
                }

                HStack {
                    Picker("Secondes", selection: $secondesSelection) {
                        ForEach(secondes, id: \.self) {
                            Text("\($0)'")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }

                    Picker("Dixièmes", selection: $dixiemesSelection) {
                        ForEach(dixiemes, id: \.self) {
                            Text("\($0)")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .pickerStyle(.wheel)

                Spacer()
                Text("Vitesse: \(formattedVitesseCalculee)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
            }

        }
        }
        
}
//.................................................................TEMPS AU TOUR....................................
struct tpsautourView: View {
    @State var vitessefinSelection = 0
    @State var vitessesSelection = 40
    @State var pisteSelection = 250
    
    let vitesses = Array(30..<60)
    let vitessesfin = Array(0..<10)
    let longueurPiste = [200, 250, 500]
    
    // Creation de la variable tps au tour
    var tpsauTour: Double {
        let vitesseautour = Double(vitessesSelection) + (Double(vitessefinSelection) / 10)
        return ((Double(pisteSelection) / 1000) * 3600) / (Double(vitesseautour))
    }
    
    // Format du tps au tour
    var formattedtpsauTour: String {
        "\(tpsauTour.formatted(.number.precision(.significantDigits(3)))) s"
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.black, .red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
            VStack {
                Spacer()
                Text("Longueur de la piste")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                Picker("Longueur de la piste", selection: $pisteSelection) {
                    ForEach(longueurPiste, id: \.self) {
                        Text("\($0) m")
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                Text("Vitesse en km/h")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                HStack {
                    Picker("Km/h", selection: $vitessesSelection) {
                        ForEach(vitesses, id: \.self) {
                            Text("\($0)  ,")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Picker("Km/hFin", selection: $vitessefinSelection) {
                        ForEach(vitessesfin, id: \.self) {
                            Text("\($0)")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .pickerStyle(.wheel)
            
                Spacer()
                Text("Temps au tour: \(formattedtpsauTour)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}
//.................................................................BRAQUET....................................
struct braquetView: View {
    @State private var sliderPignon = 14.0
    @State private var sliderPlateau = 50.0
    @State private var sliderRPM = 90.0
    @State private var sliderCircRoue = 2124.0
    
    var vitesseCalculee: Double {
        return ((sliderCircRoue / 1000) * 0.06) * (sliderRPM * (sliderPlateau / sliderPignon))
    }
    
    
    var formattedVitesseCalculee: String {
        "\(vitesseCalculee.formatted(.number.precision(.significantDigits(3)))) km/h"
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.black, .red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
            VStack {
                
                Group{
                    HStack{
                        Text("Pignon")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(Int(sliderPignon).description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Slider(value: $sliderPignon, in: 13...17, step: 1) {
                    } minimumValueLabel: {
                        Text("13")
                    } maximumValueLabel: {
                        Text("17")
                    }
                    .padding(.horizontal)
                    .accentColor(.red)
                    
                    Spacer()
                    
                    HStack{
                        Text("Plateau")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(Int(sliderPlateau).description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Slider(value: $sliderPlateau, in: 48...60, step: 1) {
                    } minimumValueLabel: {
                        Text("48")
                    } maximumValueLabel: {
                        Text("60")
                    }
                    .padding(.horizontal)
                    .accentColor(.red)
                    
                }
                Group{
                    Spacer()
                    
                    HStack{
                        Text("Cadence de pédalage")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(Int(sliderRPM).description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Slider(value: $sliderRPM, in: 40...130, step: 1) {
                    } minimumValueLabel: {
                        Text("40")
                    } maximumValueLabel: {
                        Text("130")
                    }
                    .padding(.horizontal)
                    .accentColor(.black)
                    
                    Spacer()
                    
                    HStack{
                        Text("Circonférence de la roue")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text((sliderCircRoue/1000).description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Slider(value: $sliderCircRoue, in: 2100...2130, step: 1) {
                    } minimumValueLabel: {
                        Text("2.100")
                    } maximumValueLabel: {
                        Text("2.130")
                    }
                    .padding(.horizontal)
                    .accentColor(.black)
                    
                    
                    Spacer()
                    Spacer()
                    
                    
                    Text("Vitesse : \(formattedVitesseCalculee)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
        }
    }
}
//..............................................................POURSUITE.......................................
struct poursuiteView: View {
    @State var minutesSelection = 3
    @State var secondesSelection = 30
    @State private var valeurSliderNbreTour = 12.0
    @State private var valeurSliderTpsFirstTour = 22.0
    
    let minutes = Array(1..<6)
    let secondes = Array(0..<60)
    
    // Creation de la variable tps au tour
    var tpsauTour: Double {
        let tpspoursuite = (Double(minutesSelection)*60) + Double(secondesSelection)
        return ((Double(tpspoursuite)-valeurSliderTpsFirstTour) / (valeurSliderNbreTour - 1))
    }
    // Format du tps au tour
    var formattedtpsauTour: String {
        "\(tpsauTour.formatted(.number.precision(.significantDigits(4)))) s"
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.black, .red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
            
            VStack {
                Group {
                    Text("Temps total de la poursuite")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    HStack( spacing : 120.0) {
                        
                        Text("Minutes")
                        Text("Secondes")
                        
                    }
                    
                    HStack {
                        Picker("Minutes", selection: $minutesSelection) {
                            ForEach(minutes, id: \.self) {
                                Text("\($0)'")
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Picker("Secondes", selection: $secondesSelection) {
                            ForEach(secondes, id: \.self) {
                                Text("\($0)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Spacer()
                Group {
                    HStack{
                        Text("Temps du premier tour")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(valeurSliderTpsFirstTour.description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Slider(value: $valeurSliderTpsFirstTour, in: 15...25, step: 0.1) {
                    } minimumValueLabel: {
                        Text("15.0")
                    } maximumValueLabel: {
                        Text("25.0")
                    }
                    .padding(.horizontal)
                    .accentColor(.black)

                    
                    Spacer()
                    HStack{
                        Text("Nombre de tours")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text(Int(valeurSliderNbreTour).description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Slider(value: $valeurSliderNbreTour, in: 8...20, step: 1.0) {
                    } minimumValueLabel: {
                        Text("8")
                    } maximumValueLabel: {
                        Text("20")
                    }
                    .padding(.horizontal)
                    .accentColor(.black)
                    
                    Spacer()
                    Text("Temps au tour: \(formattedtpsauTour)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            
        }
    }
}
//.........................................CHRONO.....................

struct chronoView: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State var minutes  = 0
    @State var seconds = 0
    @State var centiseconds = 0
    @State var running = false
    @State var lapTimes : [LapTime] = []
    @State var lapCount = 1
    @State var lapMinutes = 0
    @State var lapSeconds = 0
    @State var lapCentiseconds = 0
    
    var body: some View {
        VStack{
            Text(getTimeString(cS: self.centiseconds, sS: self.seconds, mS: self.minutes))
                .font(.system(size: 60, design: .monospaced))
                .frame(width: 300.0, height: 100.0)
                .onReceive(timer){_ in
                    if(self.running){
                        self.timerCalcs()
                    }
            }
            HStack{
                Button(action: {
                    if(!self.running){
                        self.minutes = 0
                        self.seconds = 0
                        self.centiseconds = 0
                        self.lapTimes = []
                        self.lapMinutes = 0
                        self.lapSeconds = 0
                        self.lapCentiseconds = 0
                        self.lapCount = 1
                    }
                    else{
                        
                        self.lapTimes.append(LapTime(n: self.lapCount, t: self.getTimeString(cS: self.lapCentiseconds, sS: self.lapSeconds, mS: self.lapMinutes)))
                        self.lapCount += 1
                        self.lapMinutes = 0
                        self.lapSeconds = 0
                        self.lapCentiseconds = 0
                    }
                }) {
                    ZStack{
                        Circle().fill(Color.gray).frame(width: 100, height: 100)
                        self.running ? Text("Lap").foregroundColor(Color.white).font(.system(size: 20, design: .monospaced)) : Text("Reset").foregroundColor(Color.white).font(.system(size: 20, design: .monospaced))
                    }
                }
                
                Spacer()
                Button(action: {
                    self.running = !self.running
                }) {
                    ZStack{
                        Circle().fill(self.running ? Color.red : Color.green).frame(width: 100, height: 100).font(.system(size: 20, design: .monospaced))
                        self.running ? Text("Stop").foregroundColor(Color.white).font(.system(size: 20, design: .monospaced)) : Text("Start").foregroundColor(Color.white).font(.system(size: 20, design: .monospaced))
                    }
                }
            }.padding(1)
            List{
                LapTime(n: self.lapCount, t: self.getTimeString(cS: self.lapCentiseconds, sS: self.lapSeconds, mS: self.lapMinutes))
                ForEach(self.lapTimes.reversed()) { time in
                    time
                }
            }
        }
        
    }
    
    func timerCalcs(){
        if(self.centiseconds < 99){
            self.centiseconds += 1
        }
        else{
            self.centiseconds = 0
            if(self.seconds < 59){
                self.seconds += 1
            }
            else{
                self.seconds = 0
                self.minutes += 1
            }
        }
        
        if(self.lapCentiseconds < 99){
            self.lapCentiseconds += 1
        }
        else{
            self.lapCentiseconds = 0
            if(self.lapSeconds < 59){
                self.lapSeconds += 1
            }
            else{
                self.lapSeconds = 0
                self.lapMinutes += 1
            }
        }
    }
    
    func getTimeString(cS: Int, sS : Int, mS: Int) -> String{
        var centiString = String(cS)
        var secString = String(sS)
        var minString = String(mS)
        if(cS<10){
            centiString = "0\(cS)"
        }
        if(sS<10){
            secString = "0\(sS)"
        }
        if(mS<10){
            minString = "0\(mS)"
        }
        return "\(minString):\(secString).\(centiString)"
    }
}

struct LapTime : View, Identifiable{
    let id = UUID()
    let num : Int
    let time : String
    
    var body : some View{
        HStack{
            Text("Lap \(num)").font(.system(size: 15, design: .monospaced))
            Spacer()
            Text(time).font(.system(size: 15, design: .monospaced))
        }
    }
    
    init(n : Int, t : String){
        num = n
        time = t
    }
}

//...................................historique...........................
struct historiqueView: View {
    let chronos = chronoList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chronos, id: \.self) {chrono in
                    NavigationLink(destination: Text(chrono)) {
                        Image(systemName: "stopwatch")
                        Text(chrono)
                    }.padding()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//        vitesseView()
//        tpsautourView()
//        braquetView()
//        poursuiteView()
//        historiqueView()
          chronoView()
    }
}
