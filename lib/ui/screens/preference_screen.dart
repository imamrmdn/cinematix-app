part of 'screens.dart';

class PreferenceScreen extends StatefulWidget {
  final List<String> genres = [
    'Music',
    'Horror',
    'Action',
    'Sci-Fi',
    'Drama',
    'Crime',
  ];

  final List<String> languages = [
    'English',
    'Japan',
    'Jamaica',
    'Indonesia',
  ];

  final Registration registration;

  PreferenceScreen(this.registration);

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  List<String> selectedGenre = [];
  List<String> selectedLanguage = [];
  double width = (SizeConfig.defaultWidth - 2 * 30.0 - 25) / 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //widget.registration.password = '';
        context
            .bloc<ScreenBloc>()
            .add(GoToRegistrationScreen(widget.registration));
        return;
      },
      child: Scaffold(
        body: Container(
          color: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            children: <Widget>[
              BackButtonAndText(
                text1: 'Pilih 4 genre Movie yang kamu sukai',
                text2: '',
                onTap: () {
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToRegistrationScreen(widget.registration));
                },
              ),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                children: selectedGenreWidgets(context),
              ),
              SizedBox(height: 25.0),
              Text(
                'Pilih bahasa movie yang kamu sukai?',
                style: blackTextFont.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25.0),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                children: selectedLanguageWidgets(context),
              ),
              SizedBox(height: 50.0),
              ButtonNext(
                backgroundColor: mainColor,
                onPressed: () {
                  if (selectedGenre.length != 4) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.yellowAccent,
                      messageText: Text('Pilih 4 genre', style: blackTextFont),
                    )..show(context);
                  } else if (selectedLanguage.length != 1) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Colors.yellowAccent,
                      messageText: Text('Pilih 1 bahasa', style: blackTextFont),
                    )..show(context);
                  } else {
                    widget.registration.selectedGenres = selectedGenre;
                    widget.registration.selectedLanguage =
                        selectedLanguage.toString();

                    context
                        .bloc<ScreenBloc>()
                        .add(GoToAccountConfimationScreen(widget.registration));
                  }
                },
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  //
  List<Widget> selectedGenreWidgets(BuildContext context) {
    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenre.contains(e),
              onTap: () {
                onSelectedGenre(e);
              },
            ))
        .toList();
  }

  //
  List<Widget> selectedLanguageWidgets(BuildContext context) {
    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage.contains(e),
              onTap: () {
                onSelectedLanguage(e);
              },
            ))
        .toList();
  }

  //
  void onSelectedGenre(String genre) {
    if (selectedGenre.contains(genre)) {
      setState(() {
        selectedGenre.remove(genre);
      });
    } else {
      if (selectedGenre.length < 4) {
        setState(() {
          selectedGenre.add(genre);
        });
      }
    }
  }

  //
  void onSelectedLanguage(String language) {
    if (selectedLanguage.contains(language)) {
      setState(() {
        selectedLanguage.remove(language);
      });
    } else {
      if (selectedLanguage.length < 1) {
        setState(() {
          selectedLanguage.add(language);
        });
      }
    }
  }
}
