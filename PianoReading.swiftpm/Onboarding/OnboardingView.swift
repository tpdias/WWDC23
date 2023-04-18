import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            FirstPageView().tag(0)
            SecondPageView().tag(1)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
