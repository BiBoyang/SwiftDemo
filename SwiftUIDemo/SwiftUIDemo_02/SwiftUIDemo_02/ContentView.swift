//
//  ContentView.swift
//  SwiftUIDemo_02
//
//  Created by Boyang on 2025/10/11.
//

import SwiftUI

struct ContentView: View {
    @State private var Selection: TabKey = .heart
    
    var body: some View {
        TabView(selection:$Selection) {
            Tab( "Heart",systemImage:"heart",value: TabKey.heart){
                SwiftUIView1()
            }
            Tab( "star",systemImage:"star",value: TabKey.star){
                SwiftUIView2()
            }
            Tab(value: TabKey.search, role:.search) {
                SwiftUIView3()
            }
            
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .onChange(of: Selection) { oldValue, newValue in
            print("当前选中的标签：\(newValue)")
        }
    }
}

#Preview {
    ContentView()
}

private enum TabKey:Hashable {
    case heart,star,search
}


struct SwiftUIView1: View {
    private let animals:[String] = [
        "ant",
        "baboon",
        "cat",
        "dog",
        "elephant",
        "fox",
        "giraffe",
        "horse",
        "iguana",
        "jaguar",
        "kangaroo",
        "lion",
        "monkey",
        "narwhal",
        "octopus",
        "penguin",
        "quail",
        "rhino",
        "snake",
        "tiger",
        "unicorn",
        "vulture",
        "whale",
        "xenops",
        "yak",
        "zebra"
    ]
    
    var body : some View{
        NavigationStack{
            List(animals,id: \.self){item in
                Text(item)
            }
            .navigationTitle("animals")
        }
    }
}

struct SwiftUIView2: View {
    private let fruits:[String] = [
        "Apple",
        "Banana",
        "Cherry",
        "Dragonfruit",
        "Elderberry",
        "Fig",
        "Grape",
        "Honeydew",
        "Kiwi",
        "Lemon",
        "Mango",
        "Nectarine",
        "Orange",
        "Peach",
        "Quince",
        "Raspberry",
        "Strawberry",
        "Tomato",
        "Ugli fruit",
        "Vanilla",
        "Watermelon",
        "Xigua",
        "Yellow passionfruit",
        "Zucchini"
    ]
    
    var body : some View{
        NavigationStack{
            List(fruits,id: \.self){item in
                Text(item)
            }
            .navigationTitle("fruits")
        }
    }
}

struct SwiftUIView3: View {
    @State private var searchText = ""
    private let items = [
        "item1",
        "item2",
        "item3",
        "item4",
        "item5",
        "item6",
        "item7",
        "item8",
        "item9",
        "item10",
    ]
    private var filteredItems:[String] {
        if searchText.isEmpty { return items }
        return items.filter{$0.localizedCaseInsensitiveContains(searchText)}
    }
    
        
    var body : some View{
        NavigationStack{
            List(filteredItems,id: \.self){item in
                Text(item)
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText)
    }
    
    
}
