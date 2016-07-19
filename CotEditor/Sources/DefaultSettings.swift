/*
 
 DefaultSettings.swift
 
 CotEditor
 https://coteditor.com
 
 Created by 1024jp on 2016-06-23.
 
 ------------------------------------------------------------------------------
 
 © 2004-2007 nakamuxu
 © 2014-2016 1024jp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

import Foundation
import AppKit.NSFont

let DefaultEncodings: [UInt32] = [
    CFStringBuiltInEncodings.UTF8.rawValue,   // Unicode (UTF-8)
    kCFStringEncodingInvalidId, // ----------
    
    UInt32(CFStringEncodings.shiftJIS.rawValue),  // Japanese (Shift JIS)
    UInt32(CFStringEncodings.EUC_JP.rawValue),  // Japanese (EUC)
    UInt32(CFStringEncodings.dosJapanese.rawValue),  // Japanese (Windows, DOS)
    UInt32(CFStringEncodings.shiftJIS_X0213.rawValue),  // Japanese (Shift JIS X0213)
    UInt32(CFStringEncodings.macJapanese.rawValue),  // Japanese (Mac OS)
    UInt32(CFStringEncodings.ISO_2022_JP.rawValue),  // Japanese (ISO 2022-JP)
    kCFStringEncodingInvalidId, // ----------
    
    CFStringBuiltInEncodings.macRoman.rawValue,  // Western (Mac OS Roman)
    CFStringBuiltInEncodings.windowsLatin1.rawValue,  // Western (Windows Latin 1)
    kCFStringEncodingInvalidId, // ----------
    
    UInt32(CFStringEncodings.GB_18030_2000.rawValue),  // Chinese (GB18030)
    UInt32(CFStringEncodings.big5_HKSCS_1999.rawValue),  // Traditional Chinese (Big 5 HKSCS)
    UInt32(CFStringEncodings.big5_E.rawValue),  // Traditional Chinese (Big 5-E)
    UInt32(CFStringEncodings.big5.rawValue),  // Traditional Chinese (Big 5)
    UInt32(CFStringEncodings.macChineseTrad.rawValue),  // Traditional Chinese (Mac OS)
    UInt32(CFStringEncodings.macChineseSimp.rawValue),  // Simplified Chinese (Mac OS)
    UInt32(CFStringEncodings.EUC_TW.rawValue),  // Traditional Chinese (EUC)
    UInt32(CFStringEncodings.EUC_CN.rawValue),  // Simplified Chinese (EUC)
    UInt32(CFStringEncodings.dosChineseTrad.rawValue),  // Traditional Chinese (Windows, DOS)
    UInt32(CFStringEncodings.dosChineseSimplif.rawValue),  // Simplified Chinese (Windows, DOS)
    kCFStringEncodingInvalidId, // ----------
    
    UInt32(CFStringEncodings.macKorean.rawValue),  // Korean (Mac OS)
    UInt32(CFStringEncodings.EUC_KR.rawValue),  // Korean (EUC)
    UInt32(CFStringEncodings.dosKorean.rawValue),  // Korean (Windows, DOS)
    kCFStringEncodingInvalidId, // ----------
    
    UInt32(CFStringEncodings.macArabic.rawValue),  // Arabic (Mac OS)
    UInt32(CFStringEncodings.isoLatinArabic.rawValue),  // Arabic (ISO 8859-6)
    UInt32(CFStringEncodings.macGreek.rawValue),  // Greek (Mac OS)
    UInt32(CFStringEncodings.isoLatinGreek.rawValue),  // Greek (ISO 8859-7)
    UInt32(CFStringEncodings.macHebrew.rawValue),  // Hebrew (Mac OS)
    UInt32(CFStringEncodings.isoLatinHebrew.rawValue),  // Hebrew (ISO 8859-8)
    UInt32(CFStringEncodings.macCyrillic.rawValue),  // Cyrillic (Mac OS)
    UInt32(CFStringEncodings.isoLatinCyrillic.rawValue),  // Cyrillic (ISO 8859-5)
    UInt32(CFStringEncodings.windowsCyrillic.rawValue),  // Cyrillic (Windows)
    UInt32(CFStringEncodings.macCentralEurRoman.rawValue),  // Central European (Mac OS)
    UInt32(CFStringEncodings.macTurkish.rawValue),  // Turkish (Mac OS)
    UInt32(CFStringEncodings.macIcelandic.rawValue),  // Icelandic (Mac OS)
    kCFStringEncodingInvalidId, // ----------
    
    CFStringBuiltInEncodings.isoLatin1.rawValue,  // Western (ISO Latin 1)
    UInt32(CFStringEncodings.isoLatin2.rawValue),  // Central European (ISO Latin 2)
    UInt32(CFStringEncodings.isoLatin3.rawValue),  // Western (ISO Latin 3)
    UInt32(CFStringEncodings.isoLatin4.rawValue),  // Central European (ISO Latin 4)
    UInt32(CFStringEncodings.isoLatin5.rawValue),  // Turkish (ISO Latin 5)
    UInt32(CFStringEncodings.isoLatin6.rawValue),  // Nordic (ISO Latin 6)
    UInt32(CFStringEncodings.isoLatin7.rawValue),  // Baltic (ISO Latin 7)
    UInt32(CFStringEncodings.isoLatin8.rawValue),  // Celtic (ISO Latin 8)
    UInt32(CFStringEncodings.isoLatin9.rawValue),  // Western (ISO Latin 9)
    UInt32(CFStringEncodings.isoLatin10.rawValue),  // Romanian (ISO Latin 10)
    kCFStringEncodingInvalidId, // ----------
    
    UInt32(CFStringEncodings.dosLatinUS.rawValue),  // Latin-US (DOS)
    UInt32(CFStringEncodings.windowsLatin2.rawValue),  // Central European (Windows Latin 2)
    CFStringBuiltInEncodings.nextStepLatin.rawValue,  // Western (NextStep)
    CFStringBuiltInEncodings.ASCII.rawValue,  // Western (ASCII)
    CFStringBuiltInEncodings.nonLossyASCII.rawValue,  // Non-lossy ASCII
    kCFStringEncodingInvalidId, // ----------
    
    CFStringBuiltInEncodings.UTF16.rawValue,  // Unicode (UTF-16)
    CFStringBuiltInEncodings.UTF16BE.rawValue,  // Unicode (UTF-16BE)
    CFStringBuiltInEncodings.UTF16LE.rawValue,  // Unicode (UTF-16LE)
    CFStringBuiltInEncodings.UTF32.rawValue,  // Unicode (UTF-32)
    CFStringBuiltInEncodings.UTF32BE.rawValue,  // Unicode (UTF-32BE)
    CFStringBuiltInEncodings.UTF32LE.rawValue,  // Unicode (UTF-16LE)
]




let DefaultSettings: [DefaultKey: AnyObject] = [
    .createNewAtStartup: true,
    .reopenBlankWindow: true,
    .enablesAutosaveInPlace: false,
    .trimsTrailingWhitespaceOnSave: false,
    .documentConflictOption: DocumentConflictOption.revert.rawValue,
    .syncFindPboard: false,
    .inlineContextualScriptMenu: false,
    .countLineEndingAsChar: true,
    .autoLinkDetection: false,
    .checkSpellingAsType: false,
    .highlightBraces: true,
    .highlightLtGt: false,
    .checksUpdatesForBeta: false,
    
    .showNavigationBar: true,
    .showDocumentInspector: false,
    .showStatusBar: true,
    .showLineNumbers: true,
    .showPageGuide: false,
    .pageGuideColumn: 80,
    .showStatusBarLines: true,
    .showStatusBarChars: true,
    .showStatusBarLength: false,
    .showStatusBarWords: false,
    .showStatusBarLocation: true,
    .showStatusBarLine: true,
    .showStatusBarColumn: false,
    .showStatusBarEncoding: false,
    .showStatusBarLineEndings: false,
    .showStatusBarFileSize: true,
    .splitViewVertical: false,
    .windowWidth: 600.0,
    .windowHeight: 620.0,
    .windowAlpha: 1.0,
    
    .fontName: NSFont.userFont(ofSize: 0)!.fontName,
    .fontSize: NSFont.systemFontSize(),
    .shouldAntialias: true,
    .lineHeight: 1.2,
    .highlightCurrentLine: false,
    .showInvisibles: true,
    .showInvisibleSpace: false,
    .invisibleSpace: 0,
    .showInvisibleTab: false,
    .invisibleTab: 0,
    .showInvisibleNewLine: false,
    .invisibleNewLine: 0,
    .showInvisibleFullwidthSpace: false,
    .invisibleFullwidthSpace: 0,
    .showOtherInvisibleChars: false,
    .theme: "Dendrobates",
    
    .smartInsertAndDelete: false,
    .balancesBrackets: false,
    .swapYenAndBackSlash: false,
    .enableSmartQuotes: false,
    .enableSmartDashes: false,
    .autoIndent: true,
    .tabWidth: 4,
    .autoExpandTab: false,
    .detectsIndentStyle: true,
    .appendsCommentSpacer: true,
    .commentsAtLineHead: true,
    .wrapLines: true,
    .enablesHangingIndent: true,
    .hangingIndentWidth: 0,
    .completesDocumentWords: true,
    .completesSyntaxWords: true,
    .completesStandartWords: false,
    .autoComplete: false,
    
    .lineEndCharCode: 0,
    .encodingList: DefaultEncodings.map { NSNumber(value: $0) },
    .encodingInNew: CFStringConvertEncodingToNSStringEncoding(CFStringBuiltInEncodings.UTF8.rawValue),
    .encodingInOpen: String.Encoding.autoDetection.rawValue,
    .saveUTF8BOM: false,
    .referToEncodingTag: true,
    .enableSyntaxHighlight: true,
    .syntaxStyle: "Plain Text",
    
    .fileDropArray: [[FileDropComposer.SettingKey.extensions: "jpg, jpeg, gif, png",
                      FileDropComposer.SettingKey.formatString: "<img src=\"<<<RELATIVE-PATH>>>\" alt=\"<<<FILENAME-NOSUFFIX>>>\" title=\"<<<FILENAME-NOSUFFIX>>>\" width=\"<<<IMAGEWIDTH>>>\" height=\"<<<IMAGEHEIGHT>>>\" />"]],
    
    .insertCustomTextArray: ["<br />\n", "", "", "", "", "", "", "", "", "", "",
                             "", "", "", "", "", "", "", "", "", "",
                             "", "", "", "", "", "", "", "", "", ""],
    
    .setPrintFont: 0,
    .printFontName: NSFont.userFont(ofSize: 0)!.fontName,
    .printFontSize: NSFont.systemFontSize(),
    .printColorIndex: PrintColorMode.blackWhite.rawValue,
    .printLineNumIndex: PrintLineNmuberMode.no.rawValue,
    .printInvisibleCharIndex: PrintInvisiblesMode.no.rawValue,
    .printHeader: true,
    .primaryHeaderContent: PrintInfoType.filePath.rawValue,
    .primaryHeaderAlignment: AlignmentType.left.rawValue,
    .secondaryHeaderContent: PrintInfoType.printDate.rawValue,
    .secondaryHeaderAlignment: AlignmentType.right.rawValue,
    .printFooter: true,
    .primaryFooterContent: PrintInfoType.none.rawValue,
    .primaryFooterAlignment: AlignmentType.center.rawValue,
    .secondaryFooterContent: PrintInfoType.pageNumber.rawValue,
    .secondaryFooterAlignment: AlignmentType.center.rawValue,
    
    // ------ settings not in preferences window ------
    .colorCodeType: 1,
    .sidebarWidth: 220,
    .recentStyleNames: [],
    
    // settings for find panel are register in CETextFinder
    
    // ------ hidden settings ------
    .usesTextFontForInvisibles: false,
    .headerFooterDateFormat: "YYYY-MM-dd HH:mm",
    .headerFooterPathAbbreviatingWithTilde: true,
    .autoCompletionDelay: 0.25,
    .infoUpdateInterval: 0.2,
    .outlineMenuInterval: 0.37,
    .showColoringIndicatorTextLength: 75000,
    .coloringRangeBufferLength: 5000,
    .largeFileAlertThreshold: 50 * pow(1024, 2),  // 50 MB
    .autosavingDelay: 5.0,
    .savesTextOrientation: true,
    .layoutTextVertical: false,
    .enableSmartIndent: true,
    .maximumRecentStyleCount: 6,
]