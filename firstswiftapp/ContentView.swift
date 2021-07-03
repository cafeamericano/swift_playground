//
//  ContentView.swift
//  firstswiftapp
//
//  Created by Matthew Farmer on 6/29/21.
//

import SwiftUI

func instantText() -> String {
    return "BLAHBLAH1"
}

func doSomething(completion: @escaping (String) -> Void) {
    let url = URL(string: "https://appsbymatthew-api-v5omtve52a-uc.a.run.app/api/skills")!
    var apiReply = String("")
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
//        print(String(data: data, encoding: .utf8)!)
        
        apiReply = String(data: data, encoding: .utf8)!
        print(apiReply)
        completion(apiReply)
    }
//    print(apiReply)
    task.resume()
//    return apiReply
//    return data
}


struct ContentView: View {
    
    var tabOne: some View {

        VStack {
            Text("Hey Queen").padding(.all)
            HStack {
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/).padding(.all)
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/).padding(.all)
            }
            Divider()
            HStack {
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/).padding(.all)
            }
            Divider()
            Menu("Menu") {
                Text("Menu Item 1")
                Text("Menu Item 2")
                Text("Menu Item 3")
            }
            Divider()
            Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
            }.padding(.all)
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }.padding(.all)
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }.padding(.all)
        }
        .accentColor(.pink)
    }
    
//    var flexibleText = Text("HI")
    
    @State private var textToUpdate: String = "Update me!"
    
    var laForma: some View {
        VStack {
            Form {
                TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                Label("Im just a label", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                Button(action: {
                    doSomething() { (reply) in
                        print("i got a reply!")
                        self.textToUpdate = reply
//                        self.textToUpdate = reply
//                        superHappyText = reply
                    }
                    print("Hello world!!!")
                }) {
                    Text("HI")
                }
                GroupBox(label: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/) {
                    TextField("Please enter", text: $textToUpdate)
                }
                Section {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Section Content@*/Text("Section Content")/*@END_MENU_TOKEN@*/
                }
                Section {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Section Content@*/Text("Section Content")/*@END_MENU_TOKEN@*/
                }
                ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                Spacer()
                ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)

            }
        }
        .accentColor(.pink)
    }
    
    var tabThree: some View {
        Text("I'm tab three")
    }
    
    var tabFour: some View {
        Text("I'm tab four")
    }
    
    var scrollBox: some View {
//        NavigationView {
            VStack {
                List {
                    simpleRow
                    simpleRow
                    simpleRow
                    simpleRow
                    simpleRow
                    simpleRow
                    simpleRow
                }
                Button(action: {
                    print("Hello world!!!")
                }) {
                    Text("HI")
                }
            }
            .navigationBarTitle(Text("SwiftUI"))
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: linkB)
//        }
    }
    
    var simpleRow: some View {
        Text("Hello world")
    }
    
    var tinyView: some View {
        Text("I'm a tiny view")
    }
    
    var tinyView2: some View {
        Text("I'm a different tiny view")
    }
    
    var navExample: some View {
        NavigationView {
            VStack {
                Button(action: {print("Hello world!!!")}) {
                    Text(instantText())
//                    Text(doSomething())
                }
                NavigationLink(destination: pictureParagraphNavbar) {
                    VStack {
                        tinyView.padding(.all)
                    }
                }
                NavigationLink(destination: scrollBox) {
                    VStack {
                        tinyView2.padding(.all)
                    }
                }
            }
        }
    }
    
    var pictureParagraphNavbar: some View {
//        NavigationView {
            ScrollView {
                Image("IMG_6012").resizable().scaledToFit().blur(radius: 0).padding(.bottom)
//                Text(doSomething())
                Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?").padding(.all)
                Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?").padding(.all)
            }
            .navigationBarTitle(Text("SwiftUI"))
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: linkB)
//        }
    }
    
    var linkA: some View {
        Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("Link")/*@END_MENU_TOKEN@*/
        }
    }
    
    var linkB: some View {
        Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("Link")/*@END_MENU_TOKEN@*/
        }
    }
    
    var body: some View {

        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            navExample.tabItem {
                Image(systemName: "envelope")
                Text("Bonjour")
            }.tag(1)
            pictureParagraphNavbar.tabItem {
                Image(systemName: "envelope")
                Text("Bonjour")
            }.tag(1)
            laForma.tabItem {
                Image(systemName: "car")
                Text("Hola")
            }.tag(1)
            tabOne
                .tabItem {
                    Image(systemName: "scribble.variable")
                    Text("Greetings")
                }
                .tag(1)
        }.accentColor(.pink)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

//self.view.backgroundColor = UIColor.blue

