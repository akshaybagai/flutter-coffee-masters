import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context). > 500) {
// this can be used to check the size of screen and act accordingly
    // }
    return const Wrap(
      children: [
        Offer(
          title: "Title",
          description: "description",
        ),
        Offer(
          title: "Title",
          description: "description",
        ),
        Offer(
          title: "Title",
          description: "description",
        ),
        Offer(
          title: "Title",
          description: "description",
        ),
        Offer(
          title: "Title",
          description: "description",
        ),
        Offer(
          title: "Title",
          description: "description",
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;

  const Offer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 150,
      child: Card(
        elevation: 7,
        color: Theme.of(context).secondaryHeaderColor,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/background.png"),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  description,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
