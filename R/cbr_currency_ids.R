#
# currency_ref <- tibble::tribble(
#
#   ~en_name, ~VAL_NM_RQ, ~regular,
#
#   'Afghanistan Afgani', '01065', 0,
#   'Albanian Lek', '01025', 0,
#   'Algerian Dinar', '01030', 0,
#   'Angolan new Kwanza', '01040', 0,
#   'Argentine Peso', '01055', 0,
#   'Armenia Dram', '01060', 1,
#   'Australian Dollar', '01010', 1,
#   'Austrian Shilling', '01015', 0,
#   'Azerbaijan Manat', '01020', 1,
#   'Bahraini Dinar', '01080', 0,
#   'Bangladesh Taka', '01685', 0,
#   'Belarussian Ruble', '01090', 1,
#   'Belgium Franc', '01095', 0,
#   'Bolivian Boliviano', '01105', 0,
#   'Botswana Pula', '01110', 0,
#   'Brazil Real', '01115', 1,
#   'British Pound Sterling', '01035', 1,
#   'Brunei Dollar', '01111', 0,
#   'Bulgarian lev', '01100', 1,
#   'Burundi Franc', '01120', 0,
#   'Cambodia Riel', '01575', 0,
#   'Canadian Dollar', '01350', 1,
#   'CFA frank BCEAO', '01749', 0,
#   'CFA frank BEAC', '01748', 0,
#   'Chilean Peso', '01765', 0,
#   'China Yuan', '01375', 1,
#   'Colombian Peso', '01380', 0,
#   'Congo (Dem.Rep.) Zaire', '01245', 0,
#   'Congolese franc', '01383', 0,
#   'Costa Rican colon', '01385', 0,
#   'Croatian Kuna', '01755', 0,
#   'Cuban peso', '01395', 0,
#   'Cypriot Pound', '01365', 0,
#   'Czech Koruna', '01760', 1,
#   'Czechoslovak koruna', '01761', 0,
#   'Danish Krone', '01215', 1,
#   'Deutsche Mark', '01510', 0,
#   'Djobouti Frank', '01746', 0,
#   'ECU', '01790', 0,
#   'Ecuadoran Sucre', '01785', 0,
#   'Egyptian Pound', '01240', 0,
#   'Estonian Kroon', '01795', 0,
#   'Ethiopian Birr', '01800', 0,
#   'Euro', '01239', 1,
#   'Finnish Marka', '01740', 0,
#   'French Franc', '01750', 0,
#   'Gambian Dalasi', '01160', 0,
#   'Georgia Lari', '01210', 0,
#   'Ghana Cedi', '01165', 0,
#   'Greek Drachma', '01205', 0,
#   'Guinea Franc', '01175', 0,
#   'Hong Kong Dollar', '01200', 1,
#   'Hungarian Forint', '01135', 1,
#   'Iceland Krona', '01310', 0,
#   'Indian Rupee', '01270', 1,
#   'Indonesian Rupiah', '01280', 0,
#   'Iranian Rial', '01300', 0,
#   'Iraqi Dinar', '01290', 0,
#   'Irish Pound', '01305', 0,
#   'Italian Lira', '01325', 0,
#   'Izraeli Shekel', '01265', 0,
#   'Japanese Yen', '01820', 1,
#   'Jordanian Dinar', '01285', 0,
#   'Kazakhstan Tenge', '01335', 1,
#   'Kenyan Shilling', '01360', 0,
#   'Kuwaiti Dinar', '01390', 0,
#   'Kyrgyzstan Som', '01370', 1,
#   'Laos New Kip', '01400', 0,
#   'Latvian Lat', '01405', 0,
#   'Lebanese Pound', '01420', 0,
#   'Libyan Dinar', '01425', 0,
#   'Lithuanian talon', '01435', 0,
#   'Macedonia Denar', '01460', 0,
#   'Madagascar ariary', '01470', 0,
#   'Malawi Kwacha', '01465', 0,
#   'Malaysian Ringgit', '01475', 0,
#   'Maltese Lira', '01480', 0,
#   'Mauritania Ouguiya', '01450', 0,
#   'Mauritius Rupee', '01445', 0,
#   'Mexican Peso', '01495', 0,
#   'Moldova Lei', '01500', 1,
#   'Mongolia Tugrik', '01503', 0,
#   'Moroccan Dirham', '01485', 0,
#   'Mozambique Metical', '01498', 0,
#   'Namibian dollar', '02004', 0,
#   'Nepal Ruppe', '01515', 0,
#   'Netherlands Gulden', '01523', 0,
#   'New Zealand Dollar', '01530', 0,
#   'Nicaragua Cordoba', '01525', 0,
#   'Nigeria Naira', '01520', 0,
#   'North Korean Won', '01145', 0,
#   'Norwegian Krone', '01535', 1,
#   'Omani Rial', '01540', 0,
#   'Pakistani Rupee', '01545', 0,
#   'Paraguay Guarani', '01555', 0,
#   'Peruviann New Sol', '01560', 0,
#   'Philippines Peso', '01743', 0,
#   'Polish Zloty', '01565', 1,
#   'Portuguese Escudo', '01570', 0,
#   'Qatari Riyal', '01355', 0,
#   'Romanian Leu', '01585', 1,
#   'S.African Rand', '01810', 1,
#   'Saudi Riyal', '01580', 0,
#   'SDR', '01589', 1,
#   'Seychelles Rupee', '01595', 0,
#   'Sierra Leone Leone', '01410', 0,
#   'Singapore Dollar', '01625', 1,
#   'Slovakia Koruna', '01635', 0,
#   'Slovenia Tolar', '01640', 0,
#   'Somali Shilling', '01650', 0,
#   'South Korean Won', '01815', 1,
#   'Spanish Peseta', '01315', 0,
#   'Sri Lankan Rupee', '01780', 0,
#   'Sudanese Pound', '01660', 0,
#   'Surinam Dollar', '01665', 0,
#   'Swaziland Lilangeni', '01430', 0,
#   'Swedish Krona', '01770', 1,
#   'Swiss Franc', '01775', 1,
#   'Syrian Pound', '01630', 0,
#   'Taiwan Dollar', '01680', 0,
#   'Tajikistan Ruble', '01670', 1,
#   'Tanzanian Shilling', '01690', 0,
#   'Thai Baht', '01675', 0,
#   'Tunisian Dinar', '01695', 0,
#   'Turkish Lira', '01700', 1,
#   'Turkmenistan Manat', '01710', 1,
#   'UAE Dirham', '01230', 0,
#   'Ugandian Shilling', '01714', 0,
#   'Ukrainian Hryvna', '01720', 1,
#   'Uruguay Peso', '01725', 0,
#   'US Dollar', '01235', 1,
#   'Uzbekistan Sum', '01717', 1,
#   'Venezuelan Bolivar', '01140', 0,
#   'Vietnam Dong', '01150', 0,
#   'Yemeni Rial', '01330', 0,
#   'Yugoslavian Dinar', '01804', 0,
#   'Zambian Kwacha', '01250', 0,
#   'Zimbabwe Dollar', '01233', 0
# )
#
# currency_ref <- currency_ref %>% mutate(VAL_NM_RQ = paste0('R', VAL_NM_RQ))
#
# ru_ref_html <- '<select name="UniDbQuery.VAL_NM_RQ" id="UniDbQuery_VAL_NM_RQ">
#                         <option value="R01010">
#                             Австралийский доллар
#                         </option>
#                         <option value="R01015">
#                             Австрийский шиллинг
#                         </option>
#                         <option value="R01020">
#                             Азербайджанский манат
#                         </option>
#                         <option value="R01025">
#                             Албанский лек
#                         </option>
#                         <option value="R01030">
#                             Алжирский динар
#                         </option>
#                         <option value="R01040">
#                             Ангольская новая кванза
#                         </option>
#                         <option value="R01055">
#                             Аргентинское песо
#                         </option>
#                         <option value="R01060">
#                             Армянский драм
#                         </option>
#                         <option value="R01065">
#                             Афганский афгани
#                         </option>
#                         <option value="R01080">
#                             Бахрейнский динар
#                         </option>
#                         <option value="R01090">
#                             Белорусский рубль
#                         </option>
#                         <option value="R01095">
#                             Бельгийский франк
#                         </option>
#                         <option value="R01100">
#                             Болгарский лев
#                         </option>
#                         <option value="R01105">
#                             Боливийский боливиано
#                         </option>
#                         <option value="R01110">
#                             Ботсванская пула
#                         </option>
#                         <option value="R01115">
#                             Бразильский реал
#                         </option>
#                         <option value="R01111">
#                             Брунейский доллар
#                         </option>
#                         <option value="R01120">
#                             Бурундийский франк
#                         </option>
#                         <option value="R01135">
#                             Венгерский форинт
#                         </option>
#                         <option value="R01140">
#                             Венесуэльский боливар фу
#                         </option>
#                         <option value="R01815">
#                             Вон Республики Корея
#                         </option>
#                         <option value="R01145">
#                             Вона КНДР
#                         </option>
#                         <option value="R01150">
#                             Вьетнамский донг
#                         </option>
#                         <option value="R01160">
#                             Гамбийский даласи
#                         </option>
#                         <option value="R01165">
#                             Ганский седи
#                         </option>
#                         <option value="R01175">
#                             Гвинейский франк
#                         </option>
#                         <option value="R01200">
#                             Гонконгский доллар
#                         </option>
#                         <option value="R01205">
#                             Греческая драхма
#                         </option>
#                         <option value="R01210">
#                             Грузинский лари
#                         </option>
#                         <option value="R01215">
#                             Датская крона
#                         </option>
#                         <option value="R01230">
#                             Дирхам ОАЭ
#                         </option>
#                         <option value="R01233">
#                             Доллар Зимбабве
#                         </option>
#                         <option value="R02004">
#                             Доллар Намибии
#                         </option>
#                         <option value="R01235">
#                             Доллар США
#                         </option>
#                         <option value="R01239">
#                             Евро
#                         </option>
#                         <option value="R01240">
#                             Египетский фунт
#                         </option>
#                         <option value="R01245">
#                             Заир ДРК
#                         </option>
#                         <option value="R01250">
#                             Замбийская квача
#                         </option>
#                         <option value="R01265">
#                             Израильский новый шекель
#                         </option>
#                         <option value="R01270">
#                             Индийская рупия
#                         </option>
#                         <option value="R01280">
#                             Индонезийская рупия
#                         </option>
#                         <option value="R01285">
#                             Иорданский динар
#                         </option>
#                         <option value="R01290">
#                             Иракский динар
#                         </option>
#                         <option value="R01300">
#                             Иранский риал
#                         </option>
#                         <option value="R01305">
#                             Ирландский фунт
#                         </option>
#                         <option value="R01310">
#                             Исландская крона
#                         </option>
#                         <option value="R01315">
#                             Испанская песета
#                         </option>
#                         <option value="R01325">
#                             Итальянская лира
#                         </option>
#                         <option value="R01330">
#                             Йеменский риал
#                         </option>
#                         <option value="R01335">
#                             Казахстанский тенге
#                         </option>
#                         <option value="R01350">
#                             Канадский доллар
#                         </option>
#                         <option value="R01355">
#                             Катарский риал
#                         </option>
#                         <option value="R01360">
#                             Кенийский шиллинг
#                         </option>
#                         <option value="R01365">
#                             Кипрский фунт
#                         </option>
#                         <option value="R01370">
#                             Киргизский сом
#                         </option>
#                         <option value="R01375">
#                             Китайский юань
#                         </option>
#                         <option value="R01380">
#                             Колумбийский песо
#                         </option>
#                         <option value="R01383">
#                             Конголезский франк
#                         </option>
#                         <option value="R01385">
#                             Костариканский колон
#                         </option>
#                         <option value="R01395">
#                             Кубинское песо
#                         </option>
#                         <option value="R01390">
#                             Кувейтский динар
#                         </option>
#                         <option value="R01400">
#                             Лаосский кип
#                         </option>
#                         <option value="R01405">
#                             Латвийский лат
#                         </option>
#                         <option value="R01410">
#                             Леоне Сьерра-Леоне
#                         </option>
#                         <option value="R01420">
#                             Ливанский фунт
#                         </option>
#                         <option value="R01425">
#                             Ливийский динар
#                         </option>
#                         <option value="R01430">
#                             Лилангени Свазиленда
#                         </option>
#                         <option value="R01435">
#                             Литовский лит
#                         </option>
#                         <option value="R01435">
#                             Литовский талон
#                         </option>
#                         <option value="R01445">
#                             Маврикийская рупия
#                         </option>
#                         <option value="R01450">
#                             Мавританская угия
#                         </option>
#                         <option value="R01460">
#                             Македонский динар
#                         </option>
#                         <option value="R01465">
#                             Малавийская квача
#                         </option>
#                         <option value="R01470">
#                             Малагасийский ариари
#                         </option>
#                         <option value="R01475">
#                             Малайзийский ринггит
#                         </option>
#                         <option value="R01480">
#                             Мальтийская лира
#                         </option>
#                         <option value="R01485">
#                             Марокканский дирхам
#                         </option>
#                         <option value="R01495">
#                             Мексиканский песо
#                         </option>
#                         <option value="R01498">
#                             Мозамбикский метикал
#                         </option>
#                         <option value="R01500">
#                             Молдавский лей
#                         </option>
#                         <option value="R01503">
#                             Монгольский тугрик
#                         </option>
#                         <option value="R01510">
#                             Немецкая марка
#                         </option>
#                         <option value="R01510">
#                             Немецкая марка
#                         </option>
#                         <option value="R01515">
#                             Непальская рупия
#                         </option>
#                         <option value="R01520" selected="">
#                             Нигерийский найр
#                         </option>
#                         <option value="R01523">
#                             Нидерландский гульден
#                         </option>
#                         <option value="R01525">
#                             Никарагуанская золотая к
#                         </option>
#                         <option value="R01530">
#                             Новозеландский доллар
#                         </option>
#                         <option value="R01710">
#                             Новый туркменский манат
#                         </option>
#                         <option value="R01535">
#                             Норвежская крона
#                         </option>
#                         <option value="R01540">
#                             Оманский риал
#                         </option>
#                         <option value="R01545">
#                             Пакистанская рупия
#                         </option>
#                         <option value="R01555">
#                             Парагвайская гуарани
#                         </option>
#                         <option value="R01560">
#                             Перуанский новый соль
#                         </option>
#                         <option value="R01565">
#                             Польский злотый
#                         </option>
#                         <option value="R01570">
#                             Португальский эскудо
#                         </option>
#                         <option value="R01575">
#                             Риель Камбоджи
#                         </option>
#                         <option value="R01580">
#                             Риял Саудовской Аравии
#                         </option>
#                         <option value="R01585">
#                             Румынский лей
#                         </option>
#                         <option value="R01585">
#                             Румынский лей
#                         </option>
#                         <option value="R01589">
#                             СДР (специальные права з
#                         </option>
#                         <option value="R01595">
#                             Сейшельская рупия
#                         </option>
#                         <option value="R01625">
#                             Сингапурский доллар
#                         </option>
#                         <option value="R01630">
#                             Сирийский фунт
#                         </option>
#                         <option value="R01635">
#                             Словацкая крона
#                         </option>
#                         <option value="R01640">
#                             Словенский толар
#                         </option>
#                         <option value="R01650">
#                             Сомалийский шиллинг
#                         </option>
#                         <option value="R01660">
#                             Суданский фунт
#                         </option>
#                         <option value="R01665">
#                             Суринамский доллар
#                         </option>
#                         <option value="R01670">
#                             Таджикский рубл
#                         </option>
#                         <option value="R01670">
#                             Таджикский сомони
#                         </option>
#                         <option value="R01675">
#                             Таиландский бат
#                         </option>
#                         <option value="R01680">
#                             Тайваньский новый доллар
#                         </option>
#                         <option value="R01685">
#                             Так Бангладеш
#                         </option>
#                         <option value="R01690">
#                             Танзанийский шиллинг
#                         </option>
#                         <option value="R01695">
#                             Тунисский динар
#                         </option>
#                         <option value="R01700">
#                             Турецкая лира
#                         </option>
#                         <option value="R01710">
#                             Туркменский манат
#                         </option>
#                         <option value="R01714">
#                             Угандийский шиллинг
#                         </option>
#                         <option value="R01717">
#                             Узбекский сум
#                         </option>
#                         <option value="R01720">
#                             Украинская гривна
#                         </option>
#                         <option value="R01720">
#                             Украинский карбованец
#                         </option>
#                         <option value="R01725">
#                             Уругвайское песо
#                         </option>
#                         <option value="R01743">
#                             Филиппинское песо
#                         </option>
#                         <option value="R01740">
#                             Финляндская марка
#                         </option>
#                         <option value="R01746">
#                             Франк Джибути
#                         </option>
#                         <option value="R01748">
#                             Франк КФА ВЕАС
#                         </option>
#                         <option value="R01749">
#                             Франк КФА ВСЕАО
#                         </option>
#                         <option value="R01750">
#                             Французский франк
#                         </option>
#                         <option value="R01035">
#                             Фунт стерлингов Соединен
#                         </option>
#                         <option value="R01755">
#                             Хорватская куна
#                         </option>
#                         <option value="R01761">
#                             Чехословацкая крона
#                         </option>
#                         <option value="R01760">
#                             Чешская крона
#                         </option>
#                         <option value="R01765">
#                             Чилийское песо
#                         </option>
#                         <option value="R01770">
#                             Шведская крона
#                         </option>
#                         <option value="R01775">
#                             Швейцарский франк
#                         </option>
#                         <option value="R01780">
#                             Шри-Ланкийская рупия
#                         </option>
#                         <option value="R01785">
#                             Эквадорский сукре
#                         </option>
#                         <option value="R01790">
#                             ЭКЮ
#                         </option>
#                         <option value="R01795">
#                             Эстонская крона
#                         </option>
#                         <option value="R01800">
#                             Эфиопский быр
#                         </option>
#                         <option value="R01804">
#                             Югославский новый динар
#                         </option>
#                         <option value="R01810">
#                             Южноафриканский рэнд
#                         </option>
#                         <option value="R01820">
#                             Японская иена
#                         </option>
#                 </select>'
#
# en_ref_html <- '<select name="UniDbQuery.VAL_NM_RQ" id="UniDbQuery_VAL_NM_RQ">
#                         <option value="R01065">
#                             Afghanistan Afgani
#                         </option>
#                         <option value="R01025">
#                             Albanian Lek
#                         </option>
#                         <option value="R01030">
#                             Algerian Dinar
#                         </option>
#                         <option value="R01040">
#                             Angolan new Kwanza
#                         </option>
#                         <option value="R01055">
#                             Argentine Peso
#                         </option>
#                         <option value="R01060">
#                             Armenia Dram
#                         </option>
#                         <option value="R01010">
#                             Australian Dollar
#                         </option>
#                         <option value="R01015">
#                             Austrian Shilling
#                         </option>
#                         <option value="R01020">
#                             Azerbaijan Manat
#                         </option>
#                         <option value="R01080">
#                             Bahraini Dinar
#                         </option>
#                         <option value="R01685">
#                             Bangladesh Taka
#                         </option>
#                         <option value="R01090">
#                             Belarussian Ruble
#                         </option>
#                         <option value="R01095">
#                             Belgium Franc
#                         </option>
#                         <option value="R01105">
#                             Bolivian Boliviano
#                         </option>
#                         <option value="R01110">
#                             Botswana Pula
#                         </option>
#                         <option value="R01115">
#                             Brazil Real
#                         </option>
#                         <option value="R01035">
#                             British Pound Sterling
#                         </option>
#                         <option value="R01111">
#                             Brunei Dollar
#                         </option>
#                         <option value="R01100">
#                             Bulgarian lev
#                         </option>
#                         <option value="R01120">
#                             Burundi Franc
#                         </option>
#                         <option value="R01575">
#                             Cambodia Riel
#                         </option>
#                         <option value="R01350">
#                             Canadian Dollar
#                         </option>
#                         <option value="R01749">
#                             CFA frank BCEAO
#                         </option>
#                         <option value="R01748">
#                             CFA frank BEAC
#                         </option>
#                         <option value="R01765">
#                             Chilean Peso
#                         </option>
#                         <option value="R01375">
#                             China Yuan
#                         </option>
#                         <option value="R01380">
#                             Colombian Peso
#                         </option>
#                         <option value="R01245">
#                             Congo (Dem.Rep.) Zaire
#                         </option>
#                         <option value="R01383">
#                             Congolese franc
#                         </option>
#                         <option value="R01385">
#                             Costa Rican colon
#                         </option>
#                         <option value="R01755">
#                             Croatian Kuna
#                         </option>
#                         <option value="R01395">
#                             Cuban peso
#                         </option>
#                         <option value="R01365">
#                             Cypriot Pound
#                         </option>
#                         <option value="R01760">
#                             Czech Koruna
#                         </option>
#                         <option value="R01761">
#                             Czechoslovak koruna
#                         </option>
#                         <option value="R01215">
#                             Danish Krone
#                         </option>
#                         <option value="R01510">
#                             Deutsche Mark
#                         </option>
#                         <option value="R01510">
#                             Deutsche Mark
#                         </option>
#                         <option value="R01746">
#                             Djobouti Franc
#                         </option>
#                         <option value="R01790">
#                             ECU
#                         </option>
#                         <option value="R01785">
#                             Ecuadoran Sucre
#                         </option>
#                         <option value="R01240">
#                             Egyptian Pound
#                         </option>
#                         <option value="R01795">
#                             Estonian Kroon
#                         </option>
#                         <option value="R01800">
#                             Ethiopian Birr
#                         </option>
#                         <option value="R01239">
#                             Euro
#                         </option>
#                         <option value="R01740">
#                             Finnish Marka
#                         </option>
#                         <option value="R01750">
#                             French Franc
#                         </option>
#                         <option value="R01160">
#                             Gambian Dalasi
#                         </option>
#                         <option value="R01210">
#                             Georgia Lari
#                         </option>
#                         <option value="R01165">
#                             Ghana Cedi
#                         </option>
#                         <option value="R01205">
#                             Greek Drachma
#                         </option>
#                         <option value="R01175">
#                             Guinea Franc
#                         </option>
#                         <option value="R01200">
#                             Hong Kong Dollar
#                         </option>
#                         <option value="R01135">
#                             Hungarian Forint
#                         </option>
#                         <option value="R01310">
#                             Iceland Krona
#                         </option>
#                         <option value="R01270">
#                             Indian Rupee
#                         </option>
#                         <option value="R01280">
#                             Indonesian Rupiah
#                         </option>
#                         <option value="R01300">
#                             Iranian Rial
#                         </option>
#                         <option value="R01290">
#                             Iraqi Dinar
#                         </option>
#                         <option value="R01305">
#                             Irish Pound
#                         </option>
#                         <option value="R01325">
#                             Italian Lira
#                         </option>
#                         <option value="R01265">
#                             Izraeli Shekel
#                         </option>
#                         <option value="R01820">
#                             Japanese Yen
#                         </option>
#                         <option value="R01285">
#                             Jordanian Dinar
#                         </option>
#                         <option value="R01335">
#                             Kazakhstan Tenge
#                         </option>
#                         <option value="R01360">
#                             Kenyan Shilling
#                         </option>
#                         <option value="R01390">
#                             Kuwaiti Dinar
#                         </option>
#                         <option value="R01370">
#                             Kyrgyzstan Som
#                         </option>
#                         <option value="R01400">
#                             Laos new Kip
#                         </option>
#                         <option value="R01405">
#                             Latvian Lat
#                         </option>
#                         <option value="R01420">
#                             Lebanese Pound
#                         </option>
#                         <option value="R01425">
#                             Libyan Dinar
#                         </option>
#                         <option value="R01435">
#                             Lithuanian Lita
#                         </option>
#                         <option value="R01435">
#                             Lithuanian talon
#                         </option>
#                         <option value="R01460">
#                             Macedonia Denar
#                         </option>
#                         <option value="R01470">
#                             Madagascar ariary
#                         </option>
#                         <option value="R01465">
#                             Malawi Kwacha
#                         </option>
#                         <option value="R01475">
#                             Malaysian Ringgit
#                         </option>
#                         <option value="R01480">
#                             Maltese Lira
#                         </option>
#                         <option value="R01450">
#                             Mauritania Ouguiya
#                         </option>
#                         <option value="R01445">
#                             Mauritius Rupee
#                         </option>
#                         <option value="R01495">
#                             Mexican Peso
#                         </option>
#                         <option value="R01500">
#                             Moldova Lei
#                         </option>
#                         <option value="R01503">
#                             Mongolia Tugrik
#                         </option>
#                         <option value="R01485">
#                             Moroccan Dirham
#                         </option>
#                         <option value="R01498">
#                             Mozambique Metical
#                         </option>
#                         <option value="R02004">
#                             Namibian dollar
#                         </option>
#                         <option value="R01515">
#                             Nepal Ruppe
#                         </option>
#                         <option value="R01523">
#                             Netherlands Gulden
#                         </option>
#                         <option value="R01710">
#                             New Turkmenistan Manat
#                         </option>
#                         <option value="R01530">
#                             New Zealand Dollar
#                         </option>
#                         <option value="R01525">
#                             Nicaragua Cordoba
#                         </option>
#                         <option value="R01520" selected="">
#                             Nigeria Naira
#                         </option>
#                         <option value="R01145">
#                             North Korean Won
#                         </option>
#                         <option value="R01535">
#                             Norwegian Krone
#                         </option>
#                         <option value="R01540">
#                             Omani Rial
#                         </option>
#                         <option value="R01545">
#                             Pakistani Rupee
#                         </option>
#                         <option value="R01555">
#                             Paraguay Guarani
#                         </option>
#                         <option value="R01560">
#                             Peruviann new Sol
#                         </option>
#                         <option value="R01743">
#                             Philippines Peso
#                         </option>
#                         <option value="R01565">
#                             Polish Zloty
#                         </option>
#                         <option value="R01570">
#                             Portuguese Escudo
#                         </option>
#                         <option value="R01355">
#                             Qatari Riyal
#                         </option>
#                         <option value="R01585">
#                             Romanian Leu
#                         </option>
#                         <option value="R01585">
#                             Romanian Leu
#                         </option>
#                         <option value="R01810">
#                             S.African Rand
#                         </option>
#                         <option value="R01580">
#                             Saudi Riyal
#                         </option>
#                         <option value="R01589">
#                             SDR
#                         </option>
#                         <option value="R01595">
#                             Seychelles Rupee
#                         </option>
#                         <option value="R01410">
#                             Sierra Leone Leone
#                         </option>
#                         <option value="R01625">
#                             Singapore Dollar
#                         </option>
#                         <option value="R01635">
#                             Slovakia Koruna
#                         </option>
#                         <option value="R01640">
#                             Slovenia Tolar
#                         </option>
#                         <option value="R01650">
#                             Somali Schilling
#                         </option>
#                         <option value="R01815">
#                             South Korean Won
#                         </option>
#                         <option value="R01315">
#                             Spanish Peseta
#                         </option>
#                         <option value="R01780">
#                             Sri Lankan Rupee
#                         </option>
#                         <option value="R01660">
#                             Sudanese Pound
#                         </option>
#                         <option value="R01665">
#                             Surinam Dollar
#                         </option>
#                         <option value="R01430">
#                             Swaziland Lilangeni
#                         </option>
#                         <option value="R01770">
#                             Swedish Krona
#                         </option>
#                         <option value="R01775">
#                             Swiss Franc
#                         </option>
#                         <option value="R01630">
#                             Syrian Pound
#                         </option>
#                         <option value="R01680">
#                             Taiwan Dollar
#                         </option>
#                         <option value="R01670">
#                             Tajikistan Ruble
#                         </option>
#                         <option value="R01670">
#                             Tajikistan Ruble
#                         </option>
#                         <option value="R01690">
#                             Tanzanian Shilling
#                         </option>
#                         <option value="R01675">
#                             Thai Baht
#                         </option>
#                         <option value="R01695">
#                             Tunisian Dinar
#                         </option>
#                         <option value="R01700">
#                             Turkish Lira
#                         </option>
#                         <option value="R01710">
#                             Turkmenistan Manat
#                         </option>
#                         <option value="R01230">
#                             UAE Dirham
#                         </option>
#                         <option value="R01714">
#                             Ugandan Shilling
#                         </option>
#                         <option value="R01720">
#                             Ukrainian Hryvnia
#                         </option>
#                         <option value="R01720">
#                             Ukrainian Hryvnia
#                         </option>
#                         <option value="R01725">
#                             Uruguay Peso
#                         </option>
#                         <option value="R01235">
#                             US Dollar
#                         </option>
#                         <option value="R01717">
#                             Uzbekistan Sum
#                         </option>
#                         <option value="R01140">
#                             Venezuelan Bolivar
#                         </option>
#                         <option value="R01150">
#                             Vietnam Dong
#                         </option>
#                         <option value="R01330">
#                             Yemeni Rial
#                         </option>
#                         <option value="R01804">
#                             Yugoslavian Dinar
#                         </option>
#                         <option value="R01250">
#                             Zambian Kwacha
#                         </option>
#                         <option value="R01233">
#                             Zimbabwe Dollar
#                         </option>
#                 </select>'
#
# ru_ref <- tibble(VAL_NM_RQ = ru_ref_html %>%
#                                read_html() %>%
#                                html_nodes('option') %>%
#                                html_attr('value'),
#
#                  ru_name = ru_ref_html %>%
#                              read_html() %>%
#                              html_nodes('option') %>%
#                              html_text() %>%
#                              gsub('\n\\s*', '', .)
#                  )
#
# en_ref <- tibble(VAL_NM_RQ = en_ref_html %>%
#                                read_html() %>%
#                                html_nodes('option') %>%
#                                html_attr('value'),
#
#                  en_name = en_ref_html %>%
#                              read_html() %>%
#                              html_nodes('option') %>%
#                              html_text() %>%
#                              gsub('\n\\s*', '', .)
#                  )
