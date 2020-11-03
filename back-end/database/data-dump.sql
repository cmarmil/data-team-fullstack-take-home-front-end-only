CREATE TABLE varietals
(
    varietal_id INT(11) AUTO_INCREMENT,
    name        varchar(256) NOT NULL,
    PRIMARY KEY (varietal_id)
);

CREATE TABLE brands
(
    brand_id INT(11) AUTO_INCREMENT,
    name     VARCHAR(256) NOT NULL,
    PRIMARY KEY (brand_id)
);

CREATE TABLE wines
(
    wine_id         INT(11) AUTO_INCREMENT,
    name            varchar(256) NOT NULL,
    brand_id        INT(11) NOT NULL,
    varietal_id     INT(11) NOT NULL,
    description     text,
    bottle_img_path varchar(256) DEFAULT '/assets/wines/folk-and-fable.png',
    PRIMARY KEY (wine_id),
    FOREIGN KEY brand_fk (brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY varietal_fk (varietal_id) REFERENCES varietals (varietal_id)
);

CREATE TABLE ratings
(
    rating_id INT(11) AUTO_INCREMENT,
    wine_id   INT(11) NOT NULL,
    rating    INT(1),
    review    text,
    PRIMARY KEY (rating_id),
    FOREIGN KEY wine_fk (wine_id) REFERENCES wines (wine_id)
);

CREATE TABLE taste_tags
(
    taste_tag_id INT(11) AUTO_INCREMENT,
    name         varchar(256) NOT NULL,
    PRIMARY KEY (taste_tag_id)
);

CREATE TABLE wine_taste_tags
(
    wine_id      INT(11) NOT NULL,
    taste_tag_id INT(11) NOT NULL,
    PRIMARY KEY (wine_id, taste_tag_id)
);


INSERT INTO varietals (name)
VALUES ('Merlot'),
       ('Chardonnay'),
       ('Pinot Noir'),
       ('Cabernet Sauvignon'),
       ('Pinot Grigiot'),
       ('Moscato');

INSERT INTO brands (name)
VALUES ('Mojave Rain'),
       ('Lost City'),
       ('Still Bend'),
       ('Jetbird'),
       ('Supergenre'),
       ('Folk & Fable');

INSERT INTO wines (name, brand_id, varietal_id, description)
VALUES ('Folk & Fable Merlot 2017', 6, 1, 'Bacon ipsum dolor amet tenderloin shank pork belly pork jowl capicola cow hamburger landjaeger. Venison ham hock jowl, chicken capicola sirloin buffalo chislic biltong pork belly sausage jerky. Buffalo kevin ribeye chicken biltong ground round filet mignon sirloin. Burgdoggen turducken pancetta sausage. Salami burgdoggen shoulder prosciutto. Short loin pig chislic swine turkey ground round, fatback kielbasa pork belly chuck jowl tri-tip kevin.'),
       ('Supergenre Chardonnay 2018', 5, 2, 'Leberkas turducken tenderloin, beef ribs chislic kielbasa pork loin tongue doner burgdoggen ground round. Salami pancetta meatball, jerky shank tri-tip spare ribs burgdoggen picanha turducken drumstick cow sirloin bacon. Prosciutto landjaeger corned beef, filet mignon chuck strip steak drumstick tri-tip biltong. Tongue swine ground round shoulder, chuck chicken turkey porchetta meatloaf buffalo alcatra.'),
       ('Jetbird Pinot Noir 2015', 4, 3, 'Pig ribeye brisket, sausage short ribs pork belly kevin chuck cow tongue. Burgdoggen tri-tip short loin, capicola alcatra shoulder pork chop ham hock venison andouille. Burgdoggen swine bresaola tail. Filet mignon kevin ground round pig bresaola shoulder.'),
       ('Still Bend Cabernet Sauvignon 2016', 3, 4, 'Fatback tongue andouille t-bone, tenderloin biltong salami short loin capicola burgdoggen turkey picanha pork chop. Pork loin pancetta turkey, rump cupim turducken alcatra tri-tip chicken shoulder pork belly cow sirloin. Salami short ribs capicola porchetta boudin, alcatra shankle tail ham venison ham hock. Picanha brisket boudin ball tip pig pork belly pork chop kielbasa meatloaf. Andouille fatback drumstick boudin pastrami corned beef pork, frankfurter tri-tip alcatra flank bresaola brisket capicola.'),
       ('Lost City Pinot Grigiot 2015', 2, 5, 'Rump porchetta filet mignon, pork belly bacon shoulder shank biltong cow brisket doner pork. Capicola pork loin doner shankle drumstick. Hamburger cupim ribeye picanha chislic. Rump tail alcatra picanha short ribs landjaeger capicola cupim tongue shoulder meatloaf fatback filet mignon. Fatback kevin pastrami meatloaf. Beef brisket pork belly ham sausage shankle bresaola chislic burgdoggen tail short loin beef ribs doner salami pig. Pastrami fatback tongue tri-tip rump, pig pork chop ball tip burgdoggen pork bresaola salami cow alcatra tail.'),
       ('Mojave Rain Moscato 2014', 1, 6, 'Bresaola alcatra pork belly, tri-tip jerky tenderloin brisket porchetta t-bone pork chop. Ground round swine drumstick meatloaf pancetta t-bone leberkas jerky. Brisket bresaola tongue chicken turducken picanha chislic burgdoggen meatball strip steak tri-tip andouille pastrami cow. Landjaeger alcatra spare ribs ham.');

INSERT INTO taste_tags (name)
VALUES ('Blackberry'),
       ('Plum'),
       ('Apple'),
       ('Smoky'),
       ('Earth'),
       ('Lemon'),
       ('Anise'),
       ('Truffle'),
       ('Nutty'),
       ('Honey'),
       ('Buttery'),
       ('Sweet');

INSERT INTO wine_taste_tags (wine_id, taste_tag_id)
VALUES (1, 1),
       (1, 2),
       (1, 4),
       (2, 9),
       (2, 10),
       (2, 6),
       (3, 2),
       (3, 4),
       (3, 8),
       (4, 1),
       (4, 5),
       (4, 8),
       (5, 3),
       (5, 6),
       (5, 9),
       (6, 11),
       (6, 3),
       (6, 6);

INSERT INTO ratings (wine_id, rating, review)
VALUES (1,5,'Voluptatem voluptas provident facere laudantium quo non numquam necessitatibus. Iste dolorum facere nam ea esse beatae. Ut iste dolorem rem et. Cumque qui aut harum ab officiis dolor expedita assumenda laudantium.\n \rAut unde sed. Ipsam enim ipsam harum totam nobis omnis dolorum. Accusantium et dolor quas est atque sequi. Sed sequi id animi dicta delectus voluptate omnis assumenda. Quam eos laborum aspernatur molestiae temporibus totam quo et iste.'),
       (1,5,'Accusantium at et sed id deserunt. Cum ut itaque eum quibusdam est totam. Minus rerum quos consequatur sed id eligendi. Et autem ea fuga. Dolorem distinctio enim provident sit cupiditate cupiditate quia.'),
       (1,4,'Aut modi repudiandae expedita. Quia rerum sit saepe. In magnam qui aperiam vitae qui et.'),
       (1,4,'Modi tenetur quas. Quaerat iusto consectetur totam id laudantium. Rerum modi minima distinctio accusantium. Ut est ut delectus. Hic dolores assumenda excepturi cum.\n \rError eaque voluptas quis eum culpa et reprehenderit. Minima quod amet quos aspernatur est. Cupiditate ipsa quia et. Beatae omnis eveniet quae suscipit dolor aperiam delectus dolor magnam. Impedit corporis sed voluptatum voluptate neque voluptatem corrupti. Voluptatem doloremque est iste facere quasi minima expedita alias.\n \rQuo omnis modi quis consequatur voluptates. Recusandae dolor cumque quod nobis odit atque. Excepturi id odio. Sit ut debitis. Placeat aspernatur eos veritatis molestias et nulla neque sit. Ipsam sequi numquam eaque sunt possimus et officia minus.'),
       (1,3,'Blanditiis eos quas autem non consequuntur accusamus hic rem. Ab quis et accusamus explicabo exercitationem repellat. Laboriosam at placeat odit recusandae iusto. Magni nisi voluptatum voluptates labore pariatur animi quas consequuntur et. Molestiae deserunt et sint non delectus dignissimos.\n \rDolores sit aut qui doloremque dicta molestiae magnam nulla sint. Excepturi iste quasi voluptate sit. Omnis molestiae quos totam et perspiciatis ipsum inventore eius culpa.'),
       (2,2,'Odio quo velit ipsa perferendis. Voluptatem in alias rerum dolor. Aut rerum nostrum magnam dolor quo qui. Maiores voluptas nostrum soluta qui similique aut et eaque rerum.\n \rEt a animi aut aperiam nemo explicabo id libero a. Eaque in fuga totam ab quia dolor. Odio similique esse consectetur pariatur rerum. Velit beatae velit sit.'),
       (2,3,'Odit et impedit id ab et quo iste. Dolorum at debitis fugit. Illum ea ad esse. Eveniet culpa sit ex voluptate odit quo quam tempore. Rerum est quas nam facilis et aut ipsum cumque. Iusto nihil unde quibusdam quo illo sit sed sit fugiat.'),
       (2,4,''),
       (2,1,'Earum alias cum tempore sit. Quidem possimus sint. Deserunt optio pariatur porro dicta accusantium.\n \rDolores atque in amet. Ut dolor ea et. Voluptas cum recusandae omnis. Ad sed veniam molestias consequatur. Asperiores et quidem ut quo quos nostrum cumque. Quia ea autem hic vitae eveniet voluptatibus.\n \rNon animi cum et odio perspiciatis consequatur quidem harum. Aperiam ea nemo consequatur hic rerum sed. Accusamus ab et adipisci nulla eos at delectus.'),
       (2,4,'Voluptatem modi ut ut. Quas vero quos consectetur ut. Soluta quis similique rerum quos esse.\n \rEius dolorem voluptas molestiae ullam. Enim explicabo architecto quisquam. Vitae similique odit expedita.\n \rNatus nam eius dolor et nisi deserunt consectetur quia illum. Vitae impedit iure pariatur delectus non sunt laudantium. Dicta molestiae eveniet officia. Est dolores qui ipsa. Repellat enim eum voluptatem quis nobis repudiandae et est.'),
       (2,4,'Rerum doloremque et et. Quam quisquam ipsam velit quaerat pariatur fugit possimus illo eum. Tempora ut deserunt dignissimos iure sint. Natus qui debitis modi quia animi iusto harum quisquam.'),
       (2,4,'Similique accusantium odio rerum consequatur voluptas placeat quisquam omnis quis. Aliquam ducimus libero esse et iusto dolor quia. Error cum eius debitis similique expedita nulla ut.\n \rAccusamus officiis ut dignissimos nostrum labore. Expedita repudiandae tenetur qui fuga nemo numquam qui ut. A et voluptate numquam dolorem laborum in quia libero deleniti. Quidem beatae provident et animi. Fuga ab dolorem recusandae quos inventore accusantium. Accusamus quia eaque soluta in porro nisi distinctio alias.\n \rPossimus eos deleniti distinctio sunt provident excepturi quo aspernatur eos. Fugit aut laudantium. Repellat iure id error.'),
       (3,2,'Officiis et voluptatum. Illum iure maiores quis. Ipsa praesentium sit eius temporibus dolorem. Ut sit error quidem non. Non quia reprehenderit adipisci tempore rerum placeat alias cupiditate porro.'),
       (3,3,'Delectus quibusdam laboriosam et rerum voluptatem. Non sapiente veniam labore ut non eius. Est quo sequi sint adipisci soluta consequatur odit sint. Aut sit quas. Porro ut consequatur dolores officiis. Fugiat eos repellendus reiciendis eum.'),
       (3,4,''),
       (3,4,'Provident nihil nemo dicta sed natus quo maxime ut aut. Rerum itaque perspiciatis sunt neque ut. Deleniti voluptatibus eveniet illo ab.'),
       (3,3,'Ut non nisi porro placeat vero doloribus pariatur nam. Tempore magnam aliquid sed. Est sapiente eaque alias aut ea vero explicabo labore natus. Aut fugiat earum voluptatibus sint voluptas similique. Ab omnis aspernatur aut similique labore culpa et aliquid. Labore sint nam consequuntur alias sit.\n \rPraesentium cum laboriosam nihil nam suscipit temporibus. Modi mollitia nulla libero. Odio sit rerum. Asperiores ipsa blanditiis accusamus quas. Libero inventore totam excepturi. Facere aspernatur repudiandae.\n \rEarum distinctio id illo voluptatem ratione. Quis et animi quaerat asperiores. Natus harum vitae modi natus unde temporibus fuga sit sint. Maiores minima ratione in delectus temporibus.'),
       (3,2,'Dolores qui mollitia tenetur ea ut corrupti ut quia. Voluptatibus qui necessitatibus et harum consequatur amet vel. Incidunt autem enim voluptatem. Et molestiae a ut et voluptate non at. Magnam ea et est rem totam rerum.'),
       (3,5,'Ipsum commodi assumenda est error eius. Voluptatibus nam voluptates ea ut veniam aut et et aut. Adipisci ut suscipit ipsam cupiditate aliquid.'),
       (3,1,'Sed rem at est iste et sit ea architecto sed. Qui explicabo vitae officiis accusamus et quia. Iste ea quia numquam.\n \rOfficiis quia doloremque perspiciatis eos enim. Dignissimos consequatur dolor iusto amet aspernatur numquam eligendi dolor. Commodi quo officia veritatis porro. Totam non est alias ut asperiores fugit assumenda et. Recusandae quia qui voluptatem in sequi. Dignissimos sunt asperiores.\n \rRerum nihil quidem totam nihil rem eveniet. Debitis voluptas laudantium est voluptatem deserunt provident fuga sint. Est hic corrupti.'),
       (4,2,'Veritatis modi omnis illo. Fugiat iste ipsa. At vitae perferendis.\n \rVoluptates hic consectetur tempora vitae. Natus dolore magnam et delectus tempore. Itaque aliquam est et est. Unde magnam animi rerum ipsa similique a illo.\n \rId quod sit illo et alias. Iure aliquid perspiciatis ea. Repellat ut explicabo ipsam molestiae corporis voluptas cupiditate. Voluptatem omnis rem et voluptatem officiis.'),
       (4,2,'Cum eum assumenda. Quod omnis consequatur fugit. Beatae consectetur recusandae rerum et perferendis aliquam corrupti ducimus. Ut asperiores porro ut placeat dignissimos veniam adipisci eos. Est aut quibusdam et recusandae magni voluptates. Consequuntur dolores quasi laboriosam ut officia quod aspernatur necessitatibus.\n \rAliquam quia aut. Praesentium a et dolorem odio. Explicabo consequatur quis qui.\n \rNumquam soluta iusto voluptate voluptas libero sed quis vel. Pariatur eos et. Magnam dolore mollitia blanditiis delectus cumque ad. Omnis ipsam dignissimos quia aut quae tempora doloremque.'),
       (4,3,'Omnis ut dolorem eos. Occaecati est cum et asperiores. Explicabo aperiam voluptas eum optio et nobis. Ducimus dolore aliquid a aspernatur. Voluptatem consequatur quae ut qui.\n \rExplicabo numquam aspernatur dolore ipsam omnis voluptas ut reprehenderit perspiciatis. In sint et atque. Neque ullam eos ut reprehenderit ea non quia fugiat neque. Et consequuntur consequatur cum laudantium hic. Rem repellat a possimus perferendis unde fugit quae quisquam.\n \rNon maxime corporis ab tempore eius non. Fugiat sint est aut aut tenetur et officia quod. Dolorem voluptate officia voluptas maiores. Quaerat expedita quos vitae facilis.'),
       (4,1,''),
       (4,2,''),
       (4,1,''),
       (4,2,'Dolor eligendi assumenda. Quasi temporibus voluptatem dolorem accusantium libero. Saepe dolore eius explicabo itaque et et. Ut eum dolor mollitia voluptates corporis sunt. Qui enim et suscipit omnis dolores.\n \rNeque est quo sint dolorem qui eveniet adipisci. Exercitationem ullam et suscipit maiores numquam placeat id omnis. Necessitatibus id id ut mollitia tempore dolores. Dolorum dignissimos vel fugiat id ducimus.\n \rUllam officia est maiores quasi. Quis porro sint omnis. Repudiandae et vel a.'),
       (5,5,'Perspiciatis quasi explicabo. Sit magnam architecto rem praesentium amet quaerat molestiae accusantium voluptatem. Omnis voluptas laborum. Saepe quia laudantium blanditiis qui mollitia maiores ipsa vero provident. Incidunt occaecati molestias aperiam quisquam saepe aliquid qui sunt.'),
       (5,5,'Eos a nobis sequi id. Facere voluptate illo. Assumenda aliquam laborum nisi aut rerum at quod recusandae voluptatibus. Dolor qui qui laboriosam.\n \rQui omnis ut ut maxime aut. Et qui mollitia. Modi molestias dolores dolores aut corrupti. Alias voluptatem et eum ut. Ipsam porro aut explicabo mollitia facilis.'),
       (5,5,''),
       (5,5,'Unde mollitia dolores. Nemo quo facilis nihil atque et explicabo omnis est. Quisquam et tempora ipsam sit illum magni.'),
       (5,4,''),
       (5,5,''),
       (5,4,''),
       (6,1,''),
       (6,2,'Et consequatur sunt porro veritatis consequatur ut accusamus. Accusamus mollitia omnis. Aut aperiam ut id quia modi modi. Repellat voluptatem ex sit accusamus.\n \rSed incidunt tempora maxime dolor dolor. Nisi harum aut nemo autem dolores reprehenderit repudiandae enim. Aliquid ducimus aut totam hic magni. Velit qui labore. Ut dolor minima illum dolores voluptates vel quidem. Nihil fugit amet dolorum doloribus vel unde delectus.\n \rError dolores et ipsum nihil laborum aspernatur. Nihil dolores itaque quasi nulla nulla at. Consequatur et est vel modi sapiente tempora nulla quia. Tenetur numquam et corporis harum dolorem omnis quia recusandae nemo. Laborum et corrupti vitae natus. Laborum non voluptate omnis hic ad ratione nulla ea.'),
       (6,3,''),
       (6,4,'Hic et aut illum fugiat non et. Consectetur quis est eius tempora omnis. Labore voluptas officia.'),
       (6,5,'Qui adipisci atque rerum. Pariatur fugit sed dolor. Enim in quisquam beatae libero nobis nostrum sunt. Qui sapiente culpa possimus recusandae quisquam ea. Et nemo enim qui fugiat quidem magni non quaerat.\n \rQuaerat quam ea provident dignissimos vel vel tempore dolores qui. Ut aut quis illo totam. Natus qui ipsa delectus provident dolores qui doloremque.'),
       (6,1,''),
       (6,2,'Fugit numquam nihil maiores. Veritatis doloribus a quia quas in hic odit. Quos doloribus nemo sed omnis nam. Sit velit ad necessitatibus eaque quisquam voluptatem sequi.\n \rTemporibus placeat sit. Occaecati quo omnis et. Ab itaque nulla labore provident labore quia maiores ipsam fuga. Numquam et nemo nulla quas ipsam voluptatem.'),
       (6,3,'Omnis voluptatem enim inventore deleniti tempora magni laudantium iste consequatur. Debitis tempora dolores aut molestiae sit aut. Voluptatum tempore autem asperiores.\n \rVoluptas qui nulla veniam adipisci dignissimos ducimus. Deserunt perspiciatis qui ducimus animi vel nostrum placeat impedit. Velit quia totam.'),
       (6,4,'');
