//
//  PDFGenerator.swift
//  NurseryApp
//
//  Created by Nimesha Jayawickrama on 2026-06-01.
//

import Foundation
import PDFKit
import UIKit

final class PDFGenerator {
 
static func createReport(
    children: Int,
    present: Int,
    incidents: Int
) -> URL {

    let renderer = UIGraphicsPDFRenderer(
        bounds: CGRect(x: 0, y: 0, width: 595, height: 842)
    )

    let url = FileManager.default.temporaryDirectory
        .appendingPathComponent("Nursery_Daily_Report.pdf")

    try? renderer.writePDF(to: url) { context in

        context.beginPage()

        let title = "Nursery Daily Report"

        title.draw(
            at: CGPoint(x: 50, y: 50),
            withAttributes: [
                .font: UIFont.boldSystemFont(ofSize: 24)
            ]
        )

        let report = """

        Generated: \(Date())

        ATTENDANCE SUMMARY
        ------------------
        Total Children: \(children)
        Present Today: \(present)
        Absent Today: \(children - present)

        INCIDENT SUMMARY
        ----------------
        Total Incidents: \(incidents)

        REPORT GENERATED FROM
        NurseryConnect iPad Application

        """

        report.draw(
            in: CGRect(
                x: 50,
                y: 100,
                width: 500,
                height: 700
            ),
            withAttributes: [
                .font: UIFont.systemFont(ofSize: 16)
            ]
        )
    }

    return url
}
 

}
