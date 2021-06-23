import 'dart:convert';
import 'dart:ffi';

import 'package:mockito/mockito.dart';
import 'package:news_list/api/api_client.dart';
import 'package:news_list/api/models/article.dart';
import 'package:news_list/api/resource.dart';

class MockGraphQlApiClient extends Mock implements Repository{

}

const String jsonData = '{"data": {"allArticles": [{"title": "Coronavirus Variants and Mutations","id": "44207088","slug": "coronavirus-variants-and-mutations","content": "","hosted": false,"sourceUrl": "https://www.nytimes.com/interactive/2021/health/coronavirus-variant-tracker.html","publisher": {"name": "New York Times"},"image": null},{"title": "The Big Money Is Going Vegan","id": "44202209","slug": "the-big-money-is-going-vegan","content": "","hosted": false,"sourceUrl": "https://www.nytimes.com/2021/05/18/business/oatly-ipo-milk-substitutes.html","publisher": {"name": "New York Times"},"image": null},{"title": "Who will pay? Europe’s bold plan on emissions risks political blowback","id": "44201931","slug": "who-will-pay-europe-s-bold-plan-on-emissions-risks-political-blowback","content": "## Euntem est semina Lorem markdownum debueram quem ultra mihi egreditur cura, tanta hostes ponto nulla, excipit. Ignavi latus, cornibus cessantem natumque oculis roganti cervus?  1. It funibus animalia casa 2. Est proles viderunt Caune sua simul 3. Officiumque flaventibus carinae veneni in Cinyphius arbor  ## Trepidare dixit sed fruatur  Fibras nata generi virides mea pectora tuta, coniunx fretaque advertere nunc cervus, occidit faciemque Alpes. Dilexit molire sistunt quisquam manibus calentes daret, ille formamque pater. Plenaque barbae Babylonia domum, Venus sparsosque neque, dea non procul, Panthoides a femina sonantem quoque. Umbrae uti quo praefertur annis ferebat. Patriam et oculos vultus?  ## Quid amore vel voluit  Silent nunc prima quod Phaethon Pandione sua hic ortos de quae quidem tamen est. Dilectus Isthmo oris hamatis est fores quoniam tum aureus carmen!  > Helenum luna licet mactas aestus sorores gelidi quamquam simplex pastoribus > mollit membra, et, expetit. In cogeris terra, venti ultra, profanus nec > cessent, mea sors?","hosted": true,"sourceUrl": "https://www.ft.com/content/a4e3791b-9d9e-4bf9-ae74-fe1cf1980625","publisher": {"name": "Financial Times"},"image": null}]}}';
