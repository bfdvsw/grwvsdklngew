//
//  conversionpage10.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct ConversionPage10: View {
    let onNext: () -> Void
    @State private var animateCards = false
    @State private var animateArrow = false
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Premium gradient background matching other conversion pages
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.05, green: 0.1, blue: 0.25),
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color.black
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    // Header with back button and robot
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
                    
                    // Premium sleep-themed icon matching other conversion pages
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
                    .padding(.top, 20)
                    
                    // Enhanced title matching other conversion pages
                    Text("Good habits lead to better sleep")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .lineSpacing(4)
                        .padding(.top, 32)
                    
                    Spacer()
                    
                    // Cards section
                    HStack(spacing: 20) {
                        // "Bad Habits" card
                        VStack(spacing: 0) {
                            // Card header
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.3, green: 0.2, blue: 0.3),
                                                Color(red: 0.2, green: 0.15, blue: 0.25)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(height: 80)
                                
                                Text("Bad Habits")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                            // Card content
                            VStack(spacing: 12) {
                                BadHabitRow(text: "Stay up late")
                                BadHabitRow(text: "Blue Light")
                                BadHabitRow(text: "Too much coffee")
                                BadHabitRow(text: "Wet hair")
                                BadHabitRow(text: "Heavy food")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 24)
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
                            .frame(minHeight: 180)
                            
                            // Tired person placeholder
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.25, green: 0.2, blue: 0.3),
                                                Color(red: 0.15, green: 0.1, blue: 0.2)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(height: 140)
                                
                                // Placeholder for tired person image
                                VStack {
                                    Image(systemName: "figure.fall")
                                        .font(.largeTitle)
                                        .foregroundColor(.red.opacity(0.7))
                                    Text("Restless")
                                        .font(.caption)
                                        .foregroundColor(.red.opacity(0.7))
                                }
                            }
                        }
                        .scaleEffect(animateCards ? 1.0 : 0.8)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1), value: animateCards)
                        
                        // Arrow
                        VStack {
                            Spacer()
                            Image(systemName: "arrow.right")
                                .font(.title)
                                .foregroundColor(.white)
                                .scaleEffect(animateArrow ? 1.2 : 1.0)
                                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animateArrow)
                            Spacer()
                        }
                        .frame(width: 40)
                        
                        // "Good Habits" card
                        VStack(spacing: 0) {
                            // Card header
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.1, green: 0.3, blue: 0.8),
                                                Color(red: 0.05, green: 0.2, blue: 0.7)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(height: 80)
                                
                                Text("Good Habits")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                            // Card content
                            VStack(spacing: 12) {
                                GoodHabitRow(text: "Same sleep time")
                                GoodHabitRow(text: "Dark room")
                                GoodHabitRow(text: "Cool temperature")
                                GoodHabitRow(text: "Relax Bath")
                                GoodHabitRow(text: "Comfort bed")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 24)
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
                            .frame(minHeight: 180)
                            
                            // Peaceful sleep placeholder
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 0.1, green: 0.3, blue: 0.7),
                                                Color(red: 0.05, green: 0.2, blue: 0.6)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(height: 140)
                                
                                // Placeholder for peaceful sleep image
                                VStack {
                                    Image(systemName: "cloud.moon.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.cyan)
                                    Text("Peaceful Sleep")
                                        .font(.caption)
                                        .foregroundColor(.cyan)
                                }
                            }
                        }
                        .scaleEffect(animateCards ? 1.0 : 0.8)
                        .opacity(animateCards ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.3), value: animateCards)
                    }
                    .padding(.horizontal, 20)
                    
                    // Continue button
                    Button(action: {
                        onNext()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 60, height: 60)
                                .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 40)
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                    .opacity(animateCards ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.5), value: animateCards)
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                Spacer()
                
                ConversionProgressBar(currentStep: 10, initialProgress: 9.0 / 17.0)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                    animateCards = true
                    animateArrow = true
                }
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct BadHabitRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.caption)
                .foregroundColor(.red.opacity(0.8))
            
            Text(text)
                .font(.body)
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}

struct GoodHabitRow: View {
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .font(.caption)
                .foregroundColor(.cyan)
            
            Text(text)
                .font(.body)
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}
