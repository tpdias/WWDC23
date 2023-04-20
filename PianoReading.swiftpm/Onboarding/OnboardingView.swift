import SwiftUI

struct OnboardingView: View {
    @State var currentTab = 0
    @Binding var present: Bool
    var body: some View {
        //onboarding with 3 views
        TabView(selection: $currentTab,
                content:  {
            FirstPageView(currentTab: $currentTab).tag(0)
            SecondPageView(currentTab: $currentTab).tag(1)
            ThirdPageView(present: $present).tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

