// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseFile = try? JSONDecoder().decode(ResponseFile.self, from: jsonData)

import Foundation

// MARK: - ResponseFile
struct ResponseFile: Codable {
    let row: [Row]

    enum CodingKeys: String, CodingKey {
        case row = "row"
    }
}

// MARK: - Row
struct Row: Codable {
    let descKor: String
    let foodCd: String
    let groupName: String
    let makerName: MakerName
    let num: String
    let nutrCont1: String
    let nutrCont2: String
    let nutrCont3: String
    let nutrCont4: String
    let nutrCont5: String
    let nutrCont6: String
    let nutrCont7: String
    let nutrCont8: String
    let nutrCont9: String
    let researchYear: String
    let samplingMonthCd: SamplingMonthCd
    let samplingMonthName: SamplingMonthName
    let samplingRegionCd: String
    let samplingRegionName: String
    let servingSize: String
    let subRefName: SubRefName

    enum CodingKeys: String, CodingKey {
        case descKor = "DESC_KOR"
        case foodCd = "FOOD_CD"
        case groupName = "GROUP_NAME"
        case makerName = "MAKER_NAME"
        case num = "NUM"
        case nutrCont1 = "NUTR_CONT1"
        case nutrCont2 = "NUTR_CONT2"
        case nutrCont3 = "NUTR_CONT3"
        case nutrCont4 = "NUTR_CONT4"
        case nutrCont5 = "NUTR_CONT5"
        case nutrCont6 = "NUTR_CONT6"
        case nutrCont7 = "NUTR_CONT7"
        case nutrCont8 = "NUTR_CONT8"
        case nutrCont9 = "NUTR_CONT9"
        case researchYear = "RESEARCH_YEAR"
        case samplingMonthCd = "SAMPLING_MONTH_CD"
        case samplingMonthName = "SAMPLING_MONTH_NAME"
        case samplingRegionCd = "SAMPLING_REGION_CD"
        case samplingRegionName = "SAMPLING_REGION_NAME"
        case servingSize = "SERVING_SIZE"
        case subRefName = "SUB_REF_NAME"
    }
}

enum MakerName: String, Codable {
    case empty = ""
    case 도미노피자 = "도미노피자"
    case 미스터피자 = "미스터피자"
    case 뽕뜨락피자 = "뽕뜨락피자"
    case 피자알볼로 = "피자알볼로"
    case 피자에땅 = "피자에땅"
    case 피자헛 = "피자헛"
}

enum SamplingMonthCd: String, Codable {
    case avg = "AVG"
}

enum SamplingMonthName: String, Codable {
    case 평균 = "평균"
}

enum SubRefName: String, Codable {
    case 식약처12제1권 = "식약처('12) 제1권"
    case 식약처12제1권명절 = "식약처('12) 제1권/명절"
    case 식약처13제2권 = "식약처('13) 제2권"
    case 식약처13제2권명절 = "식약처('13) 제2권/명절"
    case 식약처14명절 = "식약처('14) 명절"
    case 식약처15제3권 = "식약처('15) 제3권"
    case 식약처16제4권 = "식약처('16) 제4권"
    case 식약처17제5권 = "식약처('17) 제5권"
    case 식약처19 = "식약처('19)"
}
