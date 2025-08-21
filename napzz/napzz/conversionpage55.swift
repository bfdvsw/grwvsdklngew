//
//  conversionpage55.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct ConversionPage5: View {
    let onNext: () -> Void
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    let options: [(String, String)] = [
        ("💤", "Never"),
        ("👋", "Every once in a while"),
        ("👀", "Pretty often"),
        ("🌙", "Most nights")
    ]
    
    var body: some View {
        ZStack {
            // Premium gradient background
            let topColor = Color(red: 0.05, green: 0.1, blue: 0.25)
            let middleColor = Color(red: 0.1, green: 0.05, blue: 0.2)
            let bottomColor = Color.black
            let gradientColors = Gradient(colors: [topColor, middleColor, bottomColor])
            
            LinearGradient(
                gradient: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with back button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                VStack(spacing: 32) {
                    // Premium sleep-themed icon
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.15),
                                        Color.white.opacity(0.05)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 100, height: 100)
                        
                        Image(systemName: "moon.stars.fill")
                            .font(.system(size: 40, weight: .light))
                            .foregroundColor(.white)
                            .symbolRenderingMode(.hierarchical)
                    }
                    .padding(.top, 50)
                
                    // Enhanced title
                    Text("Do you ever wake up at night and have trouble getting back to sleep?")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .lineSpacing(4)
                
                    // Premium answer options
                    VStack(spacing: 16) {
                        ForEach(options, id: \.1) { emoji, label in
                            Button(action: {
                                // Add haptic feedback for premium feel
                                let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                impactFeedback.impactOccurred()
                                onNext()
                            }) {
                                HStack(spacing: 20) {
                                    Text(emoji)
                                        .font(.title2)
                                    Text(label)
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    // Subtle arrow indicator
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white.opacity(0.4))
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 20)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.white.opacity(0.08),
                                                    Color.white.opacity(0.04)
                                                ]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [
                                                            Color.white.opacity(0.15),
                                                            Color.white.opacity(0.05)
                                                        ]),
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    ),
                                                    lineWidth: 1
                                                )
                                        )
                                )
                            }
                            .buttonStyle(PremiumButtonStyle())
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                ConversionProgressBar(currentStep: 5, initialProgress: 4.0 / 17.0)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                }
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}

// Custom button style for premium feel
struct piPremiumButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
