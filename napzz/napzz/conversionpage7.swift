//
//  conversionpage7.swift
//  napzz
//
//  Created by Morris Romagnoli on 04/07/2025.
//
import SwiftUI

struct ConversionPage7: View {
    let onNext: () -> Void
    @State private var animateChart = false
    @State private var animateStars = false
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
            
            // Animated star field
            ForEach(0..<80, id: \.self) { _ in
                Circle()
                    .fill(Color.white.opacity(Double.random(in: 0.1...0.4)))
                    .frame(width: CGFloat.random(in: 1...3), height: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(animateStars ? Double.random(in: 0.3...1.0) : 0)
                    .animation(.easeInOut(duration: Double.random(in: 1.5...3.5)).repeatForever(autoreverses: true), value: animateStars)
            }
            
            VStack(spacing: 0) {
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
                            
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .font(.system(size: 40, weight: .light))
                                .foregroundColor(.white)
                                .symbolRenderingMode(.hierarchical)
                        }
                        .padding(.top, 50)
                        
                        // Enhanced title matching other conversion pages
                        Text("We've helped 93% of users improve their sleep")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .lineSpacing(4)
                        
                        // Chart section with premium styling
                        VStack(alignment: .leading, spacing: 20) {
                            // Chart container with premium styling
                            ZStack {
                                // Premium background matching button styles
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
                                    .frame(height: 280)
                                
                                VStack(spacing: 24) {
                                    // "Your Ideal Sleep" label with better styling
                                    HStack {
                                        Spacer()
                                        HStack(spacing: 8) {
                                            Image(systemName: "checkmark.seal.fill")
                                                .foregroundColor(Color.cyan)
                                                .font(.title3)
                                            Text("Your Ideal Sleep")
                                                .font(.system(size: 18, weight: .semibold))
                                                .foregroundColor(Color.cyan)
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.cyan.opacity(0.15))
                                        )
                                        .padding(.trailing, 20)
                                    }
                                    
                                    // Enhanced chart
                                    EnhancedChartView(animate: animateChart)
                                        .frame(height: 160)
                                        .padding(.horizontal, 20)
                                    
                                    // Chart labels with better styling
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Sleep Quality")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                        .padding(.leading, 20)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 4) {
                                            Text("Time Progress")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.white.opacity(0.8))
                                            HStack(spacing: 4) {
                                                ForEach(0..<8) { _ in
                                                    Circle()
                                                        .fill(Color.white.opacity(0.4))
                                                        .frame(width: 3, height: 3)
                                                }
                                                Image(systemName: "arrow.right")
                                                    .font(.caption)
                                                    .foregroundColor(.white.opacity(0.6))
                                            }
                                        }
                                        .padding(.trailing, 20)
                                    }
                                }
                                .padding(.vertical, 20)
                            }
                            .padding(.horizontal, 20)
                            
                            // Improvement text with better styling
                            Text("See improvement in just 3 days")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.horizontal, 40)
                        }
                        .padding(.top, 20)
                        
                        // Bottom text with statistics - enhanced styling
                        VStack(spacing: 20) {
                            Text("Partnered with top sleep experts, ShutEye has helped ")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white.opacity(0.9))
                            +
                            Text("over 1,000,000 users")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.cyan)
                            +
                            Text(" achieve better sleep quality.")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.top, 20)
                        .padding(.bottom, 100)
                        
                        Spacer()
                    }
                }
                .opacity(animateContent ? 1.0 : 0.0)
                .scaleEffect(animateContent ? 1.0 : 0.95)
                .animation(.easeOut(duration: 0.8), value: animateContent)
                
                Spacer()
                
                ConversionProgressBar(currentStep: 7, initialProgress: 6.0 / 17.0)
            }
            
            // Floating continue button matching other conversion pages
            VStack {
                Spacer()
                
                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                    impactFeedback.impactOccurred()
                    onNext()
                }) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "arrow.right")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .scaleEffect(animateContent ? 1.0 : 0.8)
                .opacity(animateContent ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(1.2), value: animateContent)
                .padding(.bottom, 50)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateContent = true
                }
            }
            animateStars = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                animateChart = true
            }
        }
        .onDisappear {
            animateContent = false
        }
    }
}

struct EnhancedChartView: View {
    let animate: Bool
    @State private var lineProgress: Double = 0
    @State private var fillProgress: Double = 0
    @State private var pointsProgress: [Double] = Array(repeating: 0, count: 6)
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 40
            let height = geometry.size.height - 20
            
            ZStack {
                // Chart data points
                let points = [
                    CGPoint(x: 0, y: height * 0.8),
                    CGPoint(x: width * 0.2, y: height * 0.6),
                    CGPoint(x: width * 0.4, y: height * 0.4),
                    CGPoint(x: width * 0.6, y: height * 0.25),
                    CGPoint(x: width * 0.8, y: height * 0.1),
                    CGPoint(x: width, y: height * 0.05)
                ]
                
                // Gradient fill under curve with smooth animation
                Path { path in
                    if fillProgress > 0 {
                        path.move(to: CGPoint(x: 20, y: points[0].y + 10))
                        
                        for i in 0..<points.count {
                            let point = CGPoint(x: points[i].x + 20, y: points[i].y + 10)
                            if i == 0 {
                                path.move(to: point)
                            } else {
                                // Use smooth curves instead of straight lines
                                let previousPoint = CGPoint(x: points[i-1].x + 20, y: points[i-1].y + 10)
                                let controlPoint1 = CGPoint(x: previousPoint.x + (point.x - previousPoint.x) * 0.5, y: previousPoint.y)
                                let controlPoint2 = CGPoint(x: previousPoint.x + (point.x - previousPoint.x) * 0.5, y: point.y)
                                path.addCurve(to: point, control1: controlPoint1, control2: controlPoint2)
                            }
                        }
                        
                        path.addLine(to: CGPoint(x: width + 20, y: height + 10))
                        path.addLine(to: CGPoint(x: 20, y: height + 10))
                        path.closeSubpath()
                    }
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.cyan.opacity(0.4 * fillProgress),
                            Color.cyan.opacity(0.2 * fillProgress),
                            Color.cyan.opacity(0.05 * fillProgress),
                            Color.clear
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
                // Main curve line with smooth drawing animation
                Path { path in
                    if lineProgress > 0 {
                        path.move(to: CGPoint(x: 20, y: points[0].y + 10))
                        
                        for i in 1..<points.count {
                            let point = CGPoint(x: points[i].x + 20, y: points[i].y + 10)
                            let previousPoint = CGPoint(x: points[i-1].x + 20, y: points[i-1].y + 10)
                            
                            // Create smooth curves
                            let controlPoint1 = CGPoint(x: previousPoint.x + (point.x - previousPoint.x) * 0.5, y: previousPoint.y)
                            let controlPoint2 = CGPoint(x: previousPoint.x + (point.x - previousPoint.x) * 0.5, y: point.y)
                            path.addCurve(to: point, control1: controlPoint1, control2: controlPoint2)
                        }
                    }
                }
                .trim(from: 0, to: lineProgress)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.cyan, Color.cyan.opacity(0.8)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                
                // Animated chart points
                ForEach(0..<points.count, id: \.self) { index in
                    ZStack {
                        // Outer glow
                        Circle()
                            .fill(Color.cyan.opacity(0.3))
                            .frame(width: 16, height: 16)
                            .scaleEffect(pointsProgress[index])
                        
                        // Main point
                        Circle()
                            .fill(Color.cyan)
                            .frame(width: 10, height: 10)
                            .scaleEffect(pointsProgress[index])
                        
                        // Inner highlight
                        Circle()
                            .fill(Color.white)
                            .frame(width: 4, height: 4)
                            .scaleEffect(pointsProgress[index])
                    }
                    .position(
                        x: points[index].x + 20,
                        y: points[index].y + 10
                    )
                }
                
                // Final achievement point with special animation
                if pointsProgress.last ?? 0 > 0.5 {
                    ZStack {
                        // Pulsing outer ring
                        Circle()
                            .stroke(Color.cyan, lineWidth: 2)
                            .frame(width: 32, height: 32)
                            .scaleEffect(pointsProgress.last ?? 0)
                            .opacity(0.6)
                        
                        // Main achievement circle
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.cyan, Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 24, height: 24)
                            .scaleEffect(pointsProgress.last ?? 0)
                        
                        // Checkmark
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                            .scaleEffect(pointsProgress.last ?? 0)
                    }
                    .position(
                        x: points.last!.x + 20,
                        y: points.last!.y + 10
                    )
                }
            }
        }
        .onAppear {
            if animate {
                // Animate line drawing
                withAnimation(.easeInOut(duration: 2.0)) {
                    lineProgress = 1.0
                }
                
                // Animate fill with slight delay
                withAnimation(.easeInOut(duration: 1.5).delay(0.5)) {
                    fillProgress = 1.0
                }
                
                // Animate points sequentially
                for i in 0..<pointsProgress.count {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(i) * 0.3 + 0.8)) {
                        pointsProgress[i] = 1.0
                    }
                }
            }
        }
        .onChange(of: animate) { newValue in
            if newValue {
                // Reset and animate
                lineProgress = 0
                fillProgress = 0
                pointsProgress = Array(repeating: 0, count: 6)
                
                withAnimation(.easeInOut(duration: 2.0)) {
                    lineProgress = 1.0
                }
                
                withAnimation(.easeInOut(duration: 1.5).delay(0.5)) {
                    fillProgress = 1.0
                }
                
                for i in 0..<pointsProgress.count {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(i) * 0.3 + 0.8)) {
                        pointsProgress[i] = 1.0
                    }
                }
            }
        }
    }
}
