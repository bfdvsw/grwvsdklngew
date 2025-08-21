//
//  conversionpage13.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//

import SwiftUI

struct conversionpage13: View {
    let onNext: () -> Void
    @State private var progress: Double = 0
    @State private var animateContent = false
    @Environment(\.presentationMode) var presentationMode
    
    // Timer for progress animation
    @State private var timer: Timer?
    
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
                
                VStack(spacing: 0) {
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
                    .padding(.top, 50)
                    
                    // Enhanced title matching other conversion pages
                    Text("Creating your sleep report...")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .lineSpacing(4)
                        .padding(.bottom, 60)
                        .opacity(animateContent ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.8).delay(0.3), value: animateContent)
                    
                    // Progress Circle
                    ZStack {
                        // Background circle
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                            .frame(width: 160, height: 160)
                        
                        // Progress circle
                        Circle()
                            .trim(from: 0.0, to: progress)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 8, lineCap: .round)
                            )
                            .frame(width: 160, height: 160)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 0.3), value: progress)
                        
                        // Percentage text
                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .animation(.easeInOut(duration: 0.2), value: progress)
                    }
                    .padding(.bottom, 80)
                    .scaleEffect(animateContent ? 1.0 : 0.8)
                    .opacity(animateContent ? 1.0 : 0.0)
                    .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(0.5), value: animateContent)
                    
                    // User count section
                    VStack(spacing: 15) {
                        Text("10+ Million Users")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(animateContent ? 1.0 : 0.0)
                            .animation(.easeInOut(duration: 0.8).delay(1.0), value: animateContent)
                        
                        Text("have chosen shuteye")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .opacity(animateContent ? 1.0 : 0.0)
                            .animation(.easeInOut(duration: 0.8).delay(1.2), value: animateContent)
                    }
                    .padding(.bottom, 40)
                    
                    // User avatars
                    UserAvatarsView()
                        .opacity(animateContent ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 1.0).delay(1.5), value: animateContent)
                    
                    Spacer()
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                Spacer()
                
                ConversionProgressBar(currentStep: 13, initialProgress: 12.0 / 17.0)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                }
            }
            startAnimations()
        }
        .onDisappear {
            animateContent = false
            timer?.invalidate()
        }
    }
    
    private func startAnimations() {
        // Start progress animation after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            startProgressAnimation()
        }
    }
    
    private func startProgressAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if progress < 1.0 {
                // Smooth progress increment with slight randomness for realism
                let increment = Double.random(in: 0.008...0.025)
                progress = min(progress + increment, 1.0)
                
                // Add haptic feedback at certain milestones
                if progress >= 0.25 && progress < 0.3 {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                } else if progress >= 0.5 && progress < 0.55 {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                } else if progress >= 0.75 && progress < 0.8 {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                }
            } else {
                // Animation complete
                timer?.invalidate()
                
                // Navigate to next page after completion
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    onNext()
                }
            }
        }
    }
}

struct UserAvatarsView: View {
    @State private var animateAvatars = false
    
    let avatarPositions: [(x: CGFloat, y: CGFloat)] = [
        (-60, -40),   // Top left
        (0, -60),     // Top center
        (60, -40),    // Top right
        (-80, 0),     // Middle left
        (80, 0),      // Middle right
        (-60, 40),    // Bottom left
        (0, 60),      // Bottom center
        (60, 40),     // Bottom right
        (-30, -20),   // Additional positions
        (30, -20),
        (-30, 20),
        (30, 20)
    ]
    
    var body: some View {
        ZStack {
            ForEach(0..<avatarPositions.count, id: \.self) { index in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.8),
                                Color.purple.opacity(0.6),
                                Color.pink.opacity(0.4)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: circleSize(for: index), height: circleSize(for: index))
                    .offset(
                        x: avatarPositions[index].x,
                        y: avatarPositions[index].y
                    )
                    .scaleEffect(animateAvatars ? 1.0 : 0.0)
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.8)
                        .delay(Double(index) * 0.1),
                        value: animateAvatars
                    )
                    .opacity(0.7)
            }
        }
        .frame(height: 150)
        .onAppear {
            withAnimation {
                animateAvatars = true
            }
        }
    }
    
    private func circleSize(for index: Int) -> CGFloat {
        let sizes: [CGFloat] = [40, 50, 35, 45, 30, 40, 55, 38, 32, 42, 36, 44]
        return sizes[index % sizes.count]
    }
}
