//extensions on String
extension NonNullString on String?{

  String orEmpty(){

    if(this == null){
      return "";
    } else {
      return this!;
    }

  }

}

//extensions on Integer

extension NonNullInteger on int?{

  int orEmpty(){

    if(this == null){
      return 0;
    } else {
      return this!;
    }

  }

}