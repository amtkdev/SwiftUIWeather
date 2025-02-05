//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by AMTK on 2025/01/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Hikone, JPN")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 3)

                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 66)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.heavyrain.fill", temperature: 55)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 11) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 41, height: 41)
            Text("\(temperature)°")
                .font(.system(size: 29, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
