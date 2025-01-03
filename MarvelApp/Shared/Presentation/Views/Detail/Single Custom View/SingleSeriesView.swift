import SwiftUI

struct SingleSeriesView: View {
    
    var singleSeriesData: ResultSeries
    
    var body: some View {
    
        VStack {
            AsyncImage(url: URL(string: "\(singleSeriesData.thumbnail.path).jpg")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.red, lineWidth: 10)
                    }
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 100)
            }
            
            VStack {
                Text(singleSeriesData.title)
                    .font(.title2)
                    .foregroundStyle(.red)
                
                Text(singleSeriesData.description ?? "Has no description...")
                    .font(.title3)
                    .lineLimit(3)
                    .padding(.vertical, 1)
            }
            .padding()
            .foregroundStyle(Color.black) 
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 300, height: 370)
        .shadow(radius: 6, x: 5, y: 5)
    }
       
}

#Preview {
    SingleSeriesView(singleSeriesData: ResultSeries(id: 01, title: "Captain America", description: "From German", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", fileExtension: ".jpg")))
}
