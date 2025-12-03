//
//  LandmarkList.swift
//  Landmarks
//
//  Created by yilin on 2025/11/26.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //        List(landmarks, id: \.id) { landmark in
        //            LandmarkRow(landmark: landmark)
                    // 使用 List 展示一组行
                    // landmarks: 数据数组（来自 ModelData）
                    // id: \.id -> 使用每个 landmark 的 `id` 属性作为唯一标识（Key Path）
                    // 闭包参数 landmark 为当前元素，用来构建对应的行视图
        //            LandmarkRow(landmark: landmarks[0])
        //            LandmarkRow(landmark:landmarks[1])
        
        
        NavigationSplitView {
//            List(filteredLandmarks) { landmark in
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label: {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks )
            .navigationTitle("Landmarks")
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
