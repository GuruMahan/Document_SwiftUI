//
//  ContentView.swift
//  DocumentUI
//
//  Created by Guru Mahan on 07/01/23.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel = DocumentViewModel()
  @State var isSelected = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.gray.opacity(0.2)], startPoint: .leading, endPoint: .trailing)
                VStack {
                    
                    headerView
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                    
                    ScrollView{
                        ForEach(viewModel.documentModel, id:\.id) { doc in
                            if doc.url.isEmpty {
                                
                            } else {
                                
                            }
                        }
                        frontView
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                            .padding([.top,.bottom],3)
                            .padding(.horizontal,7)
                    }
                  //Spacer()
                    
                     bottomView
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color.white)
                    
                }
                
                
            }
        }
        .fileImporter(isPresented: $isSelected, allowedContentTypes: [.image,.audio,.data]) { result in
            
            do {

                let furl = try result.get()
                print("")
                viewModel.documentModel[0].url = furl.lastPathComponent
                viewModel.documentModel[0].pathExtension = furl.pathExtension
                print("file Ext \(furl.pathExtension)")
             //   print("Url \(getUrl)")
//                if furl.startAccessingSecurityScopedResource(){
//                    let data = try Data(contentsOf: furl)
//
//                    furl.stopAccessingSecurityScopedResource()
//                }


            } catch {
                print("error: \(error)") // todo
            }

        }
        
    }
    
    @ViewBuilder var headerView: some View {
        
        HStack {
            
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "chevron.backward")
                        .font(Font.system(size: 25))
                    Text("Back")
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                }
                
            }.padding(.leading,10)
            Spacer()
            
            
                .overlay( Text("Document")
                    .padding(.horizontal,-99) , alignment: .center )
                .font(Font.system(size: 30))
            //                .alignmentGuide(VerticalAlignment.center) {   // << here !!
            //                                   $0[VerticalAlignment.top]
            //                               }
            //  .frame(alignment: .center)
            
            
            //  Spacer()
            
        }
        .padding(10)
        
    }
   
    


    @ViewBuilder var bottomView: some View {
        
        HStack(spacing: 30){
            
            Button {
                
            } label: {
                Text("Back")
                    .frame(maxWidth: .infinity )
                    .frame(height: 40)
                    .foregroundColor(.blue)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: 2))
                
                
            }
            
            //  .padding(.horizontal,30)
            Button {
                
            } label: {
                Text("Submit")
                    .frame(height: 40)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 2))
            }
            //  .padding(.horizontal,30)
        }
        .padding()
    }
    
    @ViewBuilder var frontView: some View{
        
        //MARK: ->ID Proof Stack
        VStack(alignment: .leading,spacing: 10){
            Text("Accepted Formats(JPG,PNG) - Upload File Max Size (6mb)")
                .font(Font.system(size: 12))
            Text("ID Proof")
                .font(.headline)
            HStack{
                
                
                Text("Resident / National id")
                // .font(Font.subheadline)
                    .font(Font.system(size: 12))
                    .fontWeight(.light)
                Spacer()
                Text("(max 8mb)")
                    .font(Font.system(size: 12))
                    .fontWeight(.light)
            }
            
            
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image("pdf")
                        .resizable()
                    // .aspectRatio(contentMode: .fill)
                        .frame(width: 30,height: 30)
                    // .background(Color.gray)
                        .clipped()
                } .frame(width: 50)
                    .frame(maxHeight: .infinity)
                    .background(Color.gray.opacity(0.3))
                
                //  .padding(.vertical, 12)
                
                VStack(alignment:.leading,spacing: 3){
                    
                    Text("Resident / National id")
                        .padding(.vertical,8)
                    Text("File name123ABC.pdf")
                        .fontWeight(.light)
                        .font(Font.system(size: 14))
                        .padding(.vertical,1)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(Font.system(size: 20))
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)
            Divider().frame(height: 0.5).overlay(.black)
            
            //MARK: ->Addrress Details Stack
            
            VStack(alignment: .leading,spacing: 5){
                
                Text("Addrress Details")
                    .font(.headline)
                    .font(Font.system(size: 12))
                HStack{
                    Text("Postal Address")
                        .font(Font.system(size: 12))
                        .fontWeight(.light)
                    Spacer()
                    Text("(max 8mb)")
                        .font(Font.system(size: 12))
                        .fontWeight(.light)
                }
               
                if viewModel.documentModel[0].url != "" {
                        HStack(spacing: 15){
                            Button {
                           
                            } label: {
                                Text(viewModel.documentModel[0].pathExtension).font(Font.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.red)
                                
                            } .frame(width: 50)
                                .frame(maxHeight: .infinity)
                                .background(Color.gray.opacity(0.3))
                            
                            //  .padding(.vertical, 12)
                            
                            VStack(alignment:.leading,spacing: 3){
                                
                                Text(viewModel.documentModel[0].url)
                                    .padding(.vertical,8)
                                //                                Text("File name123ABC.pdf")
                                //                                    .fontWeight(.light)
                                //                                    .font(Font.system(size: 14))
                                //                                    .padding(.vertical,1)
                            }
                            Spacer()
                            Button {
                                viewModel.documentModel[0].url  = ""
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(Font.system(size: 20))
                            }
                            .padding()
                            
                        }.frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.09))
                            .cornerRadius(5)
                        
                    }else{
                        HStack{
                        Text("Upload Postal Address")
                        Spacer()
                        Button {
                          isSelected = true
                        } label: {
                            Image(systemName: "arrow.up.to.line")
                                .font(Font.system(size: 25))
                        }
                        
                    } .padding()
                            .fontWeight(.light)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                                    .foregroundColor(.gray.opacity(0.3)) )
                }
               
            }
            .padding(2)
            Divider().frame(height: 0.5).overlay(.black)
            
            //MARK: ->Employment details Stack
            VStack(alignment: .leading,spacing:5){
                
                Text("Employment details")
                    .font(.headline)
                    .font(Font.system(size: 12))
                VStack{
                    HStack{
                        Text("Employee ID")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                        Spacer()
                        Text("(max 8mb)")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                    }
                    
                    HStack{
                        Text("Upload Employee ID")
                        Spacer()
                        Button {
                      isSelected = true
                        } label: {
                            Image(systemName: "arrow.up.to.line")
                                .font(Font.system(size: 25))
                        }
                        
                        
                    }
                    .padding()
                    .fontWeight(.light)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                            .foregroundColor(.gray.opacity(0.3))
                        
                    )
                    
                    
                    HStack{
                        Text("Appointment Order")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                        Spacer()
                        Text("(max 8mb)")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                    }
                    HStack{
                        Text("Upload Appointment Order")
                        Spacer()
                        Button {
                           isSelected = true
                        } label: {
                            Image(systemName: "arrow.up.to.line")
                                .font(Font.system(size: 25))
                        }
                        
                        
                    }
                    .padding()
                    .fontWeight(.light)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                            .foregroundColor(.gray.opacity(0.3))
                        
                    )
                }.padding(.vertical,8)
                
                
            }
            Divider().frame(height: 0.5).overlay(.black)
            
            //MARK: ->Medical Details Stack
            VStack(alignment: .leading,spacing:5){
                
                Text("Medical Details")
                    .font(.headline)
                    .font(Font.system(size: 12))
                VStack{
                    HStack{
                        Text("Health Passport")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                        Spacer()
                        Text("(max 8mb)")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                    }
                    
                    HStack{
                        Text("Upload Health Passport")
                        Spacer()
                        Button {
                         isSelected = true
                        } label: {
                            Image(systemName: "arrow.up.to.line")
                                .font(Font.system(size: 25))
                        }
                        
                        
                    }
                    .padding()
                    .fontWeight(.light)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                            .foregroundColor(.gray.opacity(0.3))
                        
                    )
                    
                    
                    HStack{
                        Text("Vaccination - QR Code(Optional)")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                        Spacer()
                        Text("(max 8mb)")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                    }
                    HStack{
                        Text("Upload Vaccination - QR Code")
                        Spacer()
                        Button {
                          isSelected = true
                        } label: {
                            Image(systemName: "arrow.up.to.line")
                                .font(Font.system(size: 25))
                        }
                        
                        
                    }
                    .padding()
                    .fontWeight(.light)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                            .foregroundColor(.gray.opacity(0.3))
                        
                    )
                }.padding(.vertical,8)
                
                
            }
            
        }
        //  Spacer()
        
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
