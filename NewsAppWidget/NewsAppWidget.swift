//
//  NewsAppWidget.swift
//  NewsAppWidget
//
//  Created by Uwais Alqadri on 12/12/20.
//

import WidgetKit
import SwiftUI
import Intents
import SwiftyJSON

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct NewsAppWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text("Headline")
                .font(Font.footnote.smallCaps())
//                .foregroundColor(.secondary)
            
            Text("Menteri di Indonesia")
                .font(.headline)
                .foregroundColor(.black)
            
            Text("jdi ceritanya menteri di indosia tuh korup mulu gase")
                .font(.footnote)
                .foregroundColor(.gray)
            
        }.padding(10)
    }
}

@main
struct NewsAppWidget: Widget {
    let kind: String = "NewsAppWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            NewsAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("News App")
        .description("Headline News.")
    }
}

struct NewsAppWidget_Previews: PreviewProvider {
    static var previews: some View {
        NewsAppWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}



