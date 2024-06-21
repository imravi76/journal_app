import 'package:flutter/material.dart';

class JudgmentTab extends StatelessWidget {
  final List<Map<String, String>> judgements = [
    {
      'title': 'Jai Prakash vs. The State of Haryana, (1991) 1 SCC 504',
      'description':
      'The Right to Information Act, 2005 (RTI Act) is an Indian law that grants citizens the right to access information held by public authorities. It aims to promote transparency, accountability, and reduce corruption by empowering individuals to request and receive information on various aspects of government functioning.',
      'file': 'case_document.pdf',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    {
      'title': 'Manohar Singh Vs State Of Rajasthan and ors on 16 January 2015',
    },
    // Add more judgements as needed
  ];

  JudgmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SingleChildScrollView(
          child: Column(
            children: judgements.map((judgement) {
              return JudgementItem(judgement: judgement);
            }).toList(),
          ),
        ),
      ),
        const Text("Judgements", style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16
        ),)
    ]
    );
  }
}

class JudgementItem extends StatefulWidget {
  final Map<String, String> judgement;

  const JudgementItem({required this.judgement, super.key});

  @override
  _JudgementItemState createState() => _JudgementItemState();
}

class _JudgementItemState extends State<JudgementItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isExpanded = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 0.1,
          color: Colors.transparent,
        ),
        gradient: _isExpanded
            ? const LinearGradient(
          colors: [Color(0xffFF606D), Color(0xff4A82FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
      ),
      child: Card(
        clipBehavior: Clip.none,
        color: Colors.white,
        child: ExpansionTile(
          shape: const Border(),
          textColor: _colorAnimation.value,
          onExpansionChanged: (expanded) {
            if (expanded) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          title: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Text(
                widget.judgement['title'] ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = _isExpanded
                        ? const LinearGradient(
                      colors: [Color(0xffFF606D), Color(0xff4A82FF)],
                    ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
                        : null,
                ),
              );
            },
          ),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Final Judgement",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            if (widget.judgement['description'] != null)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                child: Text(widget.judgement['description'] ?? ''),
              ),
            if (widget.judgement['file'] != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xfffff3eb),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.picture_as_pdf_outlined, color: Colors.red),
                      const Column(
                        children: [
                          Text("Document.pdf"),
                          Text("1000 KB • 12 pages"),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
