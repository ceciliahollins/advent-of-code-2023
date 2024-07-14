let testInput =
"""
535144221552125621625641615236131424133421342255675636461136552736333777761755467241756764617525746645143133243456241234365241163425511435312
242342355141464653656245331426654443161437471275475611124127332415123124764256716647474217246355243234614541315523324523431212224661123332325
343125341164531442331633115163521731672676327323314423624573436262343344165616236733257621477662221735555632452162216466353633215465644525332
332142135232251652452566435266571526246636441453461571122724514173732777245636765113177246676516416766343221135546331134121122136461431425451
111241256154131461333614541667416524512526251776313625376711716617346144623161373443273167467573754273774425464742315152523123224566433225514
443451213415212224512663535112437737777522363716235212364474745124517677726143362677126547777344647575125766345541162653366111231164432213351
524152564435443253545311244136172324613172317255451665222457665782734258537225323581273142144656241547272331315213314132445315643321625231414
225323144523323324541645553241272711661615426764552124155345736566638638625262223522545447742177731432333235671624545654435221435164442233132
311261556455362421332641565126555163557251161537724526446643384572787576388444765326626448356541127556632254363755741761253241433111513424653
324653145342416321534164115662446526761765776342627356883878528442523528425248532876424284263615665172551662466176527466111643135316531365222
116664215426222523125437365144253275756213217172458774676324445635328842373756576875668332524256752415615316724575466627355524462646233336344
414611343631131335434461564647345561316344422868433368368456225588383332562563363282848437888727745436455262655741315641263431424552551135325
114142263611511146527442146523572765436515284572777252562527536647246454555267672883373362446327544283352255415357466636576742452535316511411
413364111163146661342135447355567157265687587348388686868257876725567562523573542743345332255764588674735631232127121653735615421424335323545
516134141426164141721146654643347443423566267242662242243444452556644785244226736488427277887742567825856437435245526265242434222611321454536
543513512136616472617427143746156744358586627538726288355826382846477322622537688842757733527338534848845761124764161237531463613425545462562
461514112421433347363563422142234233557482688434783343753552568233547886473764327244848732668488456788784732573656433227567611243542215613362
313264155562256655133112673726366278444836852656875565743377838838387573346566648374778733676263764375822677515345376154375467647241424314655
536366462635246734563777435463444368432654775786542733328788626825858772463268756544782576247744733344685538872277115643437255142623424216256
146241646123532135142425554146766748258543774533633356826668744549969353589896492355242286422533485222622733788531227257142461456366641142642
555135255122467751771237221755367537622346425626588562368233698755596894937578489387673825737822427324555228756724734154141634575514123241556
421142362671555516523351133432272383423244522835546447538538633873466338685486649347675923278623572678724347388543657671122577436457716134535
254434533145127722461662445728724375464387684565285657999496349936373873793336459597535948562773437364885874466738743153575544744672536152353
615256143562553627437524372457364367633356637627744493566346966699854889674347597847588737957546558722386748235324322371756644234765234152642
165652155526234326735571248622354245643527236775376567963388338998545794333543946998895969858554883587388557475278578762647335241567467661143
664632372725732527215366334422775562228476633283436885343636374894678579679888486884785576359449687257787567844264774267325171666373642232461
233135767711532234471258775284848823235884579668486893583464973489853345458757373788839759786585336375624752467327647257165237273114547514633
336321135474745736772655584654247574465435673369853857444447364487836846786768486378773758355545556377822287377584547763242416264573721434612
511257736532352713743737353675244567662784753955663957933365435797785389489384464567449863947957665653287247584466445425464313752224516135251
113174316762156244616762223532687838527845647674699963549667667944756355865753894586888647873466549657668678365443532666442761573671735274731
643212131662152747413264353428747525359693854359976563886693444589983347979458668349947565576347984749346785743874854648668134135162137537461
425636275121677216238564375443847754236965854834596357487848489864539378955737859638364338757836935734754856868486543654577532514417677572231
364335622652714752324664355473873737866336368784679763887545755497547478694558445839498958996439843587996343254323745288222736215767776245774
127655572121471253487457825464772735345395568547344369498355556857556968946999848478744448638948996735763589344354452678364255663422452711623
126432171667742714247263577474348586436456384866568857864475664995868657644457569589648859997347986697749964755457422456286753751133533715116
235267126466573545227266246477367343649496337976679556445886475544447755858995995764474945376355999967836774962624663547774587747451672536715
165143574473574766278344756622647967575659767875587568694447677655674946647694976699976945738439745393734474934673632684346624433236415625213
677251576745341842353284336422776767779466795533876496559575767787966666988488885579786498886547356454774353466437738753443446777554663335632
674346265752268858545556653846786354497338955445665947874798767846866786466787776854887789684395875739659448638486657468738624354766232146134
216343445577135787266656264866364678889938476453796965668749654749668665757847497786874846646685657393547848499538484772488686488666577173244
746774667173486523856845362684566589633355439389795898876648877798856544989664855777966896875849375776567785648853267247727253667537333346341
627543625356185455245484286697966993353476355584986564449489665476689949695759864455876468469775659943475333457889954553755634525843221136576
435412361154786444582243767578638535795433675445594655664566764849494554886796977475957864885845993688588338785865956884326542828351173566744
142756117363785557628422643596993633659955654789697677759449554975594698998596578899874567674667554835784349534658774556258227838873754472232
661452642775834764423758878894587348485535594887789559655748778958776455577574758869587744589475956547376387969978766845638855667474152271365
313357557418363358826435334337847764758959447866554669989584958587867677879676678545977945476749469848479889446375377373747448747338765362341
523631674182756858683576236386435858759668884888796946446654998898958677585668658897547689497454484754765869783937866767443243372864335141425
566767475544437855452473373673967476994674556858599899547594498959959969765766756767645787449854859444564566438954796426456328578668813327457
147123122464384356838827559646557977869447946956595879695666859975899556559865965858664866469766568666767956897334458564635768288452763523253
467773637772285228237526374486373357939988645556469794875776777775575598558787956795585479566689897467799774556448786893654438858426241674436
146514241488844876364857867794474899468879896588654455499687979588997599579776565658797949847598659698544848548368539693755276258287532572435
776142161766842756554874466358889695648887854867785464787876585856857576778677789577885998749675689449894548354783659474838272744872425632443
476152315456864686774287366383576997956464889455678685889665759768898556898888979696767576896484588844976663746678733634956735357424624153775
464217664454484525824875596643473885676649495957649486579878688756969879585576968599987659957598777795498487843436484476578242355786843252772
141346732885632768247675349694497944675989475456589969788565567668756699565588997559588989998759457955568883439447778859833825574432555666267
434411547274882482382464773563468968646848674449479897586588855595866995658776766595958666584958694644546678695743344365944773244457333473323
471211136748332242777656636574854889684856759648495558798865876787567698998798765858599877858469645995859668368669888768735334356726585527237
773347636466246723563578656468696575798987685959789577656857596978958596586969565965655799596797754568457779985747389378836233776863458743374
375123557656566287868795663693886657778645486664769688598777858557695787669665878876868686878768694644465497776479667634358743322753822845424
427762135563347568679364675654346365566685457545755777996897855595787787867765789586667556559664564797846899799744393435887235688445263466767
312155232485868536836994433679955888888996845876755688777797776597969696666766895566969857776684965585549845974999657946463486623632875531521
661243545525746326556937688645958794647989464885576787796985956687977677797698876797676997588559697886648797579865647638848356436228223552432
173151332842846438456848797467435794448495876979996879966997596796868887868766766867786976557687657585678477548947433643774787443653478836245
632135376534828638346796838844859444544577977688687759565785999797977669899988687956999967687989577684786494765456467354343774658462362573366
753373543472783263248863999776374985745958468788578765796789968777678786788967879678678989987895984946459656469744357445333438644477657841775
625275325474353472469688474995986874987884756668855975797686698998677789966769798698665788877798945889799968465886939939979835625352364835557
251523352752463583599645987576479786476588598559779886978798887896786779886799999679986667757576867998854845867473448653365974848463566236714
452771725623662223355948879854936548498848559768899977869659899868877877996687796799869965767857989758459656695398835374963447426437666725523
425165673425282678494445469339348578494498884687868989886796776678787666867899688869768597569596556767747876776949558458878724454464836344616
166242472337253664549746878934497766965647549568969857977669986998677968687788877767886676695565966574744669988778763948363968243273844572621
566746382468555556786743537393894777667678458895695886859799668998698897889799869689769765668885884674489797595797654464485465432464385337652
441354534574635833293856877664889889958984469766599698958769996889698867796868666697787958879577795757448598645669798336789528638542785832446
373415865855453325874786586748335589676959775985595988759696696776697867788979667688865578869766986966545964665989696546573854644325353465135
651422746465424355874685868473485796784978774556689656566877966876877686879788778676856965979879778886869595896436639979593324348552747464432
171571387248574264293956958695465458875966444768867687695759968897688796676769877869855887578785575466797449869883447575649977845635323242337
766637444745433468286696549965599574856576697577698586885559678697686969796898769679766975986659568887549598854784639889438832328555384673647
362242754422662845453733689468338544899687476795759566598579876698898698686976798786876985596695857896899998487685438737888543828348884625372
614466724357454428468846833749687998958876668466656857889986686976777688897996766785888976667656859975669595895767585558998446468636236232252
461146445323558227333476469498499758679596759559879766677686686666696898779866666868767867979968697884486578647494737945546444254284782855172
551344337654855528686946388769339844689659945969668589887555587698778796776797689858878896667789757579884867976347898653954942676643728481216
767445756462827888346484364673394659644958884865877779698756698786698879869867999796966855577899677644885785488685946864689248727763383655631
362634426236484362633775357364594487655465946799668967798786969997978776787677686775678869866557446598787579488977578843575737828454257443672
462722468656633626345687957759485995647588886895679897766659696668699889699776885996956767888855758996889446678753735887839528573645548525452
663671356654766544865736434533787598967864679895988869858585787586689978676887757967667755667856665865498795644968539345698287328673882853712
552467668222784536867738738886745395974974468487697876585878778699968678798758679998577776967874564946846865776745834878739677754684883815113
734742752435746737887575465876955396679649879447585975776565569656996567996859785869589666676559565447769855664494787974787348376485438772227
346117356374246286263684848356894584778887654957466577976799685596798667859889559877995899859557885556759985857465797593364327467327837366456
737517454582483774254959776734466666756549677848759568665776857769858656688566565795575599894574578897895588449899978685546538644746257373251
417127576544778672585855768387493878764865589865465878699969678867767599796996877987785659594498855959485975788743388886456585684565784474116
635411772283555377336435783393866899879885555957466496659887865855756867996885657796895986964998687987664554895578569445328444282552445735365
764172734847647754255544948834397974575646656876577447897755668885665765585958766789688788764658779477677877635355865794365833284478846251647
177777365745238423657744766555578856845559588879647794898657569865868755597976958695868577585546556649547837883635546877332565688447222356424
635637143866676876735466367457656779755596895494964887785859695797667899688985787666755595889768777549947374854456645887755463433638547451164
255214442883438237476466633443677499979687984586579748885589668967989995555759569996586579757967677768966875893847363588878326348868657513461
275657235644726457588377794395844883696497478965747979468645566788697987858767967585899668996589888987765887884695587465344755444476465237436
667265175123548486752263657933483595578888966544945975959796486586668696758769969664845446867558867758449394935593386353842863277564321574632
655127341777228268776342374766343334349764444954687548786769477666996878878698878547747854446577555776933356653469973846828446624573446317172
733516377367644232524864236958593879883666656976955495996799448494757569859894487545854498879995947646656866959988346377234248737546753265222
613441573135542254553483365678634587733758478684444465745596594674985794954797969956887499678559788733379799544958693457463737557643634572456
573671574336388842867827567344858499899598887946546449578867485979985888645696578887544447495446754679583533586834533682777825528245152474321
743336221366334834628325323686376869398764596544588964666447649666475954786467456677664777546889875548953664976596567858655883828361337547732
415152175152252788626838247879764778346876777877555444567868788569477856854564676764965599585875564894786758337973946243573724523466264755172
157323563336537283768267456534589686789477753935485655444456545477857857978445996447468676589644354489674563986657337845368748762474647676773
733156361577656576424656666472643537589475366434544664877545867587695994694784669456784454876676693968468468589568275465334767683546725166762
152162263561763254623638234358395749654735936347979756588469654974456847674969676689898556985946783436544947559353282885826227824241162342456
744147123761525222768346387475286434748596567644457884456945495668645747565786844598669754553738874556587694899944828483623653322566642117637
376434176666167268525483424388568353569745478376878939899988999777954468685599457776997765587374579985489699539627254245865326275754314665321
214552461262663542683482867478488695957868498856867533476455775776857696598975544468996959988386644889696698335873552737728434614113477647247
426217271762464734845553234573834637889498986439777845955789887845967864769777987656993775365445483455986946734654785632533627531425312676633
225272473521661353672838284447337588399894759958477567566377674874499796679668945598345684845965539374654774737744234476434266323426334263317
435326371136237455883224857735485452577646533785494667943443449545545897675487869448546953394679573899747354737376245835842886326446425616614
552737711474764236135353862753742735593863755943544356858479476679636533759995743557993533888897636459388827824452333827557363714113336575462
115523354554175575624637353722766555654489933355999869356389464435354953584355784987779645458646679738474357547458882826763634776672224144743
124615672523273213161467645477667858483643495695665977469787399679454559863398984666745783597578997355983858888764768486824336733464431521152
341646537653362255772226437462357845344555935868578657935763333647368564433643368393533645698698475359244658644428667268523157263141353377513
512614221673172164163586824733754787245625479534777866776383694488497356437865575689356546679468438846225888332625345235377525164414664172162
454324754715733456577624677843234525332665779979777934339659855339865988374474946785553738786459453254666535645222832264732457233244447633116
662634424553676237121533653853474323765846334593766695988597494935768799798589985339963477699843885742787254525872573244532626373625746553565
231116215676611526155346338426233764877852353533763473353365689764864765553553739547858955336984843734627424366485354871321264344712634625241
611134143346474763363511438367764856452684455786435493759577639338786786335997759673795836334482835547637474288385433512213237174227255416543
463153336525442312445563257385534584526763468465782448447973866483578855998546998397764944823666628734567324358283274265532652117455336116553
243352431312575452576475414622478836867587776483622468356656554665853338875586563948448532478844856554656562652365242272367642672154212145421
166161356211274351375161635215458252683472458566335628425675493349688776765775984475925468746333844566437753858647252117151357131751351636515
511252362243626217761132525723646625262223222826546373355282386796476468458858348387646672367272754665342252236565341777157422117225462554665
144266132423116663663225736615773755757535755547446776456825674568723548663276668678257876562673852468564843687744711211754225346533461453442
421435211343143124714446576457142732585374622368876345442475564776576377884275665234226442878234625882723862515717671663715571637632266465156
335264556462665733656661465476672157224858242577283876627763266758373352327627535332542344472754485558227268555627527377246413775326113451315
525626161146553442116747426244115475154682857488355524865748636554765427783383572872358336772434234273844422147345232322717726625124311366316
463232142642222411564644343675612446425287465766632588858578784432227227864326844837743552727474573654547266657731557236577751462126343256122
634135522452523335314427523354243376363586585765583573644333482338528657282867733554325475247667887588614213342212666235235464351656515123444
242444434131533125263546662246422644224634885383526356734682345838865777668828838563665842682587578774443174234662133553743411564245411514623
253265146544231156463477376321135712623164526567667356227773257737356742478773665758568558762385655655665261665373223452777133635232114643426
236564634444561445336262577572775642576425477738642468538786383385245244575527676432365272782848443466572123377311712664134411554313231461534
255512214124364632315667663536336617544651311511672786263385383778362253486248837356746778454661452556577541733116166747334221114364462153264
115554545514136222613123245534427431511354212527555648342536786464453373577734873856668277472757632367126471167164133362663432543123311242611
433434555141212334616552472735541672616255122754523367475788675424347365576355753432422325472333333731633261712463661362514546163634462222532
421232553535135516525325464534676711143651747415727464222674557487464254752585327872511441223555411777324266527432555216151443426345563254253
234334336221646522341353213655623363272533327764363725266731435512567372137213666426467754435346524166644736263774445224612313416553114445315
241235121162261343114344134264617727726741233255731515564361464564574363551464574235277124347314617576454652445713221511114146364363253151423
431354521122445332314461621331511147655553573321146762445466217343353652433623251417154527734413672623571575322614251331635166233262132253342
522124441316156225561332361545164333756437165261543137746735371135366461575575625636122122666722672312357136556356263651423446111145655321254
"""
