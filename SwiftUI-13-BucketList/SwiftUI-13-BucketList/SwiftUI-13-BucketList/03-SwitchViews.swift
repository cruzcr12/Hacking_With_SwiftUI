//
//  03-SwitchViews.swift
//  SwiftUI-13-BucketList
//
//  Created by Esteban Cruz on 11/10/24.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
  var body: some View {
    Text("Loading...")
  }
}

struct SuccessView: View {
  var body: some View {
    Text("Success!")
  }
}
struct FailedView: View {
  var body: some View {
    Text("Failed.")
  }
}


struct _3_SwitchViews: View {
    var loadingState = LoadingState.loading
    
    var body: some View {
        if loadingState == .loading {
          LoadingView()
        } else if loadingState == .success {
          SuccessView()
        } else if loadingState == .failed {
          FailedView()
        }
    }
}

#Preview {
    _3_SwitchViews()
}
