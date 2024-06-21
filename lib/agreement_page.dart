import 'package:flutter/material.dart';
import 'package:journal_app/widgets/custom_action_bar.dart';
import 'package:journal_app/widgets/custom_btn.dart';
import 'package:journal_app/widgets/warning_sign.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({super.key});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:
                  [Color(0xfffcb4c0), Color(0xffb0c5fa)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              const CustomActionBar(title: "Agreement Writer", isHome: false,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.yellow,
                ),
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                child: const Text("Your Document is Ready", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8, top: 24, bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16, top: 16, bottom: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClinton, a Latin professor at Hampered-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Minibus Bono rum et Malo rum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Minibus Bono rum et Malo rum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rack ham.")),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: WarningSign(),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtn(text: "Answer Q & A", outlineBtn: true,),
                  CustomBtn(text: "View first draft", outlineBtn: false,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
