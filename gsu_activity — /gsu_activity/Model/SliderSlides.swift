//
//  SliderSlides.swift
//  gsu_activity
//
//  Created by юра шинкар on 16.01.23.
//

import Foundation

class SliderSlides {
    func getSlides()->[Slides] {
        var slides: [Slides] = []
        
        let slide1 = Slides(id: 1, text: "GSU Activity - это информационное приложение для бронирования билетов на различные массовые мероприятия в ГГУ имени Франциска Скорины", img: #imageLiteral(resourceName: "slide1"))
        let slide2 = Slides(id: 2, text: "Добро пожаловать!", img: #imageLiteral(resourceName: "slide2"))
        let slide3 = Slides(id: 3, text: " ", img: #imageLiteral(resourceName: "slide3"))
        
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
        
        return slides
    }
}
