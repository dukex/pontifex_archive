import 'package:pontifex_archive/data/models.dart';

Pope popeBenedictXVI = Pope(
  id: "Benedictus-XVI",
  name: "Benedictus XVI",
  motto: "Cooperatores veritatis",
  country: "Germany",
  startDate: DateTime(2005, 4, 19),
  endDate: DateTime(2013, 2, 28),
  translations: [
    PopeTranslation(
      language: "English",
      name: "Benedict XVI",
      motto: "Cooperators of the Truth",
    ),
    PopeTranslation(
      language: "Portuguese",
      name: "Bento XVI",
      motto: "Cooperadores da Verdade",
    ),
    PopeTranslation(
      language: "Spanish",
      name: "Benedicto XVI",
      motto: "Cooperadores de la Verdad",
    ),
    PopeTranslation(
      language: "French",
      name: "Benoit XVI",
      motto: "Coopérateurs de la Vérité",
    ),
    PopeTranslation(
      language: "Italian",
      name: "Benedetto XVI",
      motto: "Cooperatori della Verità",
    ),
    PopeTranslation(
      language: "German",
      name: "Benedikt XVI",
      motto: "Mitarbeiter der Wahrheit",
    ),
  ],
);

// List<Document> documentsBenedictXVI = [
//   Document(
//     pope: popeBenedictXVI,
//     type: "enc",
//     name: "Caritas in veritate",
//     date: DateTime(2009, 6, 29),
//     url: "https://example.com/text1",
//     translations: [
//       DocumentTranslation(
//         language: "English",
//         name: "Charity in Truth",
//         url: "https://example.com/text1-en",
//       ),
//       DocumentTranslation(
//         language: "Portuguese",
//         name: "Caridade na Verdade",
//         url: "https://example.com/text1-pt",
//       ),
//     ],
//   ),
//   Document(
//     pope: popeBenedictXVI,
//     type: "enc",
//     name: "Spe salvi",
//     date: DateTime(2007, 11, 30),
//     url: "https://example.com/text2",
//     translations: [
//       DocumentTranslation(
//         language: "English",
//         name: "Saved in Hope",
//         url: "https://example.com/text2-en",
//       ),
//       DocumentTranslation(
//         language: "Portuguese",
//         name: "Salvos na Esperança",
//         url: "https://example.com/text2-pt",
//       ),
//     ],
//   ),
//   Document(
//     pope: popeBenedictXVI,
//     type: "enc",
//     name: "Deus caritas est",
//     date: DateTime(2005, 12, 25),
//     url: "https://example.com/text3",
//     translations: [
//       DocumentTranslation(
//         language: "English",
//         name: "God is Love",
//         url: "https://example.com/text3-en",
//       ),
//       DocumentTranslation(
//         language: "Portuguese",
//         name: "Deus é Amor",
//         url: "https://example.com/text3-pt",
//       ),
//     ],
//   ),
// ];
