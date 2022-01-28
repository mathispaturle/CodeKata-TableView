//
//  ServiceData.swift
//  TableViewsRock
//
//  Created by Mathis Paturle on 28/1/22.
//

import Foundation

class ServiceData {
    static func getData() -> DataModel {
        let header: [MostPlayedModel] = [
            MostPlayedModel(imageName: "home-1", headerName: "Canciones que te gustan"),
            MostPlayedModel(imageName: "home-2", headerName: "Freeride🔥"),
            MostPlayedModel(imageName: "home-3", headerName: "AaMood"),
            MostPlayedModel(imageName: "home-4", headerName: "RetroVision Radio"),
            MostPlayedModel(imageName: "home-5", headerName: "K-391 Radio"),
            MostPlayedModel(imageName: "home-6", headerName: "This is Robin Schulz"),
        ]
        let release = ReleaseModel(artistImageName: "profile",
                                   artistName: "RetroVision",
                                   coverImageName: "cover",
                                   songTitle: "All Night Long",
                                   moreInfo: "Jonas Blue & RetroVision")
        
        let sectionOne = AlbumStructure(title: "Hecho para ti", data: [
            AlbumData(imageName: "s1", title: "Radar de novedades", detail: "Las novedades de los artistas que sigues y nuevos temas seleccionados para ti. Se actualiza cada viernes."),
            AlbumData(imageName: "s2", title: "Daily Mix 1", detail: "RetroVision, Dubdogz, Firebeatz y más"),
            AlbumData(imageName: "s3", title: "Daily Mix 2", detail: "ODESZA, Shallou, Duskus y más"),
            AlbumData(imageName: "s4", title: "Daily Mix 3", detail: "Matt Nash, Lane 8, Linkin Park y más"),
            AlbumData(imageName: "s5", title: "Daily Mix 4", detail: "ItaloBrothers, Master Blaster, Nightcore y más"),
        ])
        
        let sectionTwo = AlbumStructure(title: "Hecho para ti", data: [
            AlbumData(imageName: "d1", title: "Robin Schulz Mix", detail: "El mix del alemán a tope de powah"),
            AlbumData(imageName: "d2", title: "RetroVision Mix", detail: "Descubre el francés en eseroides..."),
            AlbumData(imageName: "d3", title: "Mix de chill", detail: "Un momento de relax con esta playlist"),
            AlbumData(imageName: "d4", title: "Mix de la decada 2010", detail: "Revive la decada de 2010 con este mix"),
            AlbumData(imageName: "d5", title: "Miz de los 2000", detail: "Viva la nostalgia y la buena onda"),
        ])
        return DataModel(mostPlayedData: header, releaseData: release, sectionOne: sectionOne, sectionTwo: sectionTwo)
    }
}

struct DataModel {
    let mostPlayedData: [MostPlayedModel]
    let releaseData: ReleaseModel
    let sectionOne: AlbumStructure
    let sectionTwo: AlbumStructure
}

struct MostPlayedModel {
    let imageName: String
    let headerName: String
}

struct ReleaseModel {
    let artistImageName: String
    let artistName: String
    let coverImageName: String
    let songTitle: String
    let moreInfo: String
}

struct AlbumStructure {
    let title: String
    let data: [AlbumData]
}

struct AlbumData {
    let imageName: String
    let title: String
    let detail: String
}
