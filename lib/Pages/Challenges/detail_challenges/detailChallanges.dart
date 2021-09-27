import 'package:flutter/material.dart';
import 'package:sociable/Pages/Challenges/widget/challenges_item.dart';

class DetailChallanges extends StatelessWidget {
  final int idChallenges;
  final String titleChallenges;
  final bool isDone;



  DetailChallanges(this.idChallenges,this.titleChallenges,this.isDone,);
  // const DetailChallanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String deskripsiChallenges = "deskripsi chalanges";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
              ),
              Text("Detail Challenges",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            ],
          ),
        ),

        body: ListView(
          children: [
            ChallengesItem(idChallenges,titleChallenges,isDone,),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 5),
              child: Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore soluta iste porro pariatur unde perferendis molestias nemo. Molestiae placeat vitae aliquid voluptas deserunt deleniti, minima quibusdam earum iusto nisi quaerat magni adipisci maiores ipsum corporis veniam laboriosam hic quae amet debitis architecto. Suscipit, necessitatibus perferendis? Eius quisquam exercitationem ipsam vel velit quasi hic veritatis, sit libero ab corrupti. Architecto cupiditate perspiciatis suscipit reprehenderit quis quasi illo distinctio ipsum! Perferendis odio eligendi dolore natus eaque blanditiis, modi placeat vero molestias dignissimos dolor error eos? Qui, quos, doloribus maiores laboriosam corporis voluptatem corrupti explicabo magnam tenetur consectetur illum incidunt amet cum fugit deserunt. Sunt pariatur eos a saepe minus necessitatibus ut tenetur rerum? Incidunt consectetur natus, molestiae accusamus dolore quidem commodi enim mollitia maiores illo cupiditate perferendis ipsam nesciunt, explicabo placeat dolores eligendi! Suscipit ipsa maiores aspernatur perspiciatis, repellat quis. Omnis voluptate vel illo rem quae aliquam esse, temporibus similique minus blanditiis neque ad dolor sunt delectus incidunt ratione consequatur corporis eius dignissimos quis accusamus cumque fuga asperiores beatae. Debitis at voluptatem reprehenderit distinctio doloribus esse provident, praesentium impedit quidem odio ad voluptatum modi autem aspernatur fuga asperiores voluptates accusantium. Quas nihil corporis dolore, aliquam vero, a animi, suscipit sapiente qui eius perspiciatis accusantium? Quos totam mollitia minus quas. Rem fugit consequatur et beatae odit soluta architecto qui debitis ipsa accusantium nobis reprehenderit id delectus optio officiis dignissimos nihil quidem aliquam nam excepturi magnam, esse odio! Blanditiis, iste asperiores! Non, cumque. Incidunt, rem. Commodi veniam eum sunt ut impedit nam hic molestiae pariatur quod sit, perspiciatis fuga explicabo magni at. Animi iure laudantium eaque doloremque non fuga inventore amet ducimus, consectetur rem itaque rerum eos voluptatum natus, delectus, deserunt tempore officiis ipsa veniam facere officia dicta magnam nisi exercitationem? Maxime illo eius accusantium voluptas quae corrupti dicta sint ratione optio suscipit sit amet, enim inventore architecto ducimus? Sunt laboriosam earum aut, reprehenderit aliquid fuga soluta suscipit, aspernatur id consequatur saepe rem recusandae? Ullam inventore accusantium atque blanditiis dolorem dicta quod fugit minus minima! Odio earum vitae praesentium eos laudantium voluptatem in eum, sequi illum quas ab asperiores voluptate dolor adipisci veritatis. Dignissimos ab minima nemo voluptates sapiente harum, consequatur adipisci, quo, aperiam et labore excepturi dolor molestias odit commodi inventore sunt perspiciatis aliquid. Expedita amet dolores modi hic laboriosam facilis tenetur mollitia quos dolor aspernatur! Cumque aliquam repellendus nihil earum autem vel. Fuga officia hic veritatis dicta, beatae vitae nobis quis, deserunt maxime, enim ratione quo suscipit qui quidem? Praesentium tenetur iure beatae! Eos libero beatae repellendus. Dicta maxime molestias quidem officiis laudantium, assumenda enim saepe vitae. Atque odit maxime blanditiis fugiat iusto harum eos, placeat quas incidunt ipsam ut tempora beatae fugit accusamus ex excepturi quisquam minima vel ullam labore! Impedit inventore totam delectus enim doloribus asperiores porro? Impedit modi maxime quidem, ullam repellendus eveniet unde! Est nam quod veniam ipsa, odio aliquid, laudantium placeat id fugit tenetur officiis necessitatibus cum? Perferendis tenetur ullam ab placeat. Laudantium minus hic non dolores sit doloremque accusamus autem dolorem rerum debitis, nihil vel vitae qui magnam deserunt! Non, accusamus nesciunt. Iusto nemo minima adipisci quo, corporis aliquid eligendi porro temporibus? At ut repudiandae quas non animi ratione illo minima optio ducimus dolor. Nihil quos officiis, debitis reiciendis nisi ratione maxime impedit placeat veniam, dolorum vitae ea atque perspiciatis autem, mollitia eligendi! Totam aut, sequi nesciunt quasi similique repellat dolores. Amet provident perspiciatis odio, facere facilis sed earum ab dolorum vel, ut temporibus in iste maiores. Vel voluptas similique necessitatibus corrupti enim ducimus, cumque expedita alias aspernatur fugiat! Accusamus suscipit pariatur deleniti reiciendis quidem expedita sequi assumenda consequatur rem cumque magni vel atque saepe libero ipsam, eligendi aliquam possimus exercitationem alias? Animi non deleniti, odio impedit eveniet harum at repellat error. Veniam iure illo placeat porro repellat nesciunt ea ad possimus distinctio eveniet hic fuga voluptatibus, rerum accusantium, voluptates commodi excepturi vel voluptas omnis laborum quaerat! Aut tempora aliquid maiores provident vitae impedit nemo ipsam, nobis doloremque accusantium quod rem. Cupiditate iusto iure optio totam, fuga in est facilis aliquam voluptas delectus. Incidunt assumenda fugit et doloribus a blanditiis ab harum quibusdam hic distinctio dignissimos corporis consectetur excepturi quod eaque aliquam, velit ex aliquid omnis porro nihil vero. Assumenda, aliquam natus? Voluptatem est, officiis rerum accusantium praesentium debitis dolor fugiat, sit perspiciatis atque ab quas inventore repellat deleniti corrupti, itaque illum ducimus nisi maxime. Ipsum, similique quod! Adipisci vero quas consequuntur. Deserunt ullam delectus, modi rem unde beatae odio temporibus id. Quisquam nisi voluptate voluptatem natus rerum, id quod. Numquam est laborum pariatur cumque a similique nesciunt totam, sequi molestiae eum doloremque enim ad. Esse quos aut numquam fugit impedit tempore laudantium excepturi, atque iure tempora pariatur eveniet maiores aperiam, minima sint molestiae nam sapiente laborum? Dolores voluptatum illo eveniet natus qui maxime nam quo rem, ducimus similique tenetur eligendi dolorem. Beatae, dolorum? Consequatur soluta, sed, ut quam quis error quo amet, quasi voluptate illum minima voluptates facere fuga totam qui veniam iusto sequi placeat sit minus id tempora! Illum consequuntur nihil quaerat exercitationem veniam neque eaque? Error quia, ducimus at reiciendis sint totam soluta nobis maiores itaque, corrupti nisi, eaque explicabo molestias vero qui! Error, repellat magnam quod corporis deserunt saepe vero minus sed molestias maiores atque vel non tenetur. Necessitatibus, deleniti. Illo magni doloribus maiores magnam in. Velit necessitatibus voluptatibus iure, natus, non error deserunt debitis sed facere odio incidunt corrupti voluptate, tempore earum perspiciatis beatae. Labore tenetur veniam velit aut, molestiae incidunt eligendi ipsa voluptatem quas culpa porro voluptas, tempore, obcaecati et voluptatum? Reiciendis quidem voluptate amet pariatur quibusdam, culpa expedita provident similique odit voluptatum, dicta, totam nostrum nobis itaque debitis voluptates blanditiis cupiditate dolores? Aliquam pariatur iusto ullam maxime, repellendus, molestiae ex perspiciatis dolorum nesciunt, odio odit tempore temporibus ea dolor. Illo rem nulla enim eum quasi omnis. Tempora perspiciatis laborum quaerat sapiente aut ex sunt repellat impedit deserunt aliquid dolorum dolores voluptas ducimus laudantium consequatur quisquam, sed obcaecati! Earum adipisci, amet blanditiis excepturi voluptas ab cum saepe sint nobis doloribus corporis dicta assumenda architecto. Illo ab dicta quisquam consequuntur molestias."),
            )

          ],
        ),
      ),
    );
  }
}
