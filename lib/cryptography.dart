import 'dart:math';

class CryptographyClass{
  String? plainteks;
  String? chiperteks;
  String? key;

  CryptographyClass({this.plainteks, this.key,this.chiperteks});

  String getEncryptExecute(){
    late List<int> decPlainteks=[];
    try{
      decPlainteks= plainteks!.codeUnits;
    }catch(e){
      print(e);
    }
    List<int>? decSplitKey=digitSpliter(key!.codeUnits);
    List<int>? decKeyBasedOnSevenSegment=decimalBasedOnSevenSegment(decSplitKey);
    List<int>? afterXor=xorStage(decPlainteks, decKeyBasedOnSevenSegment);
    List<int>? afterWrapping=wrappingBit(afterXor, 1);
    return encode(afterWrapping);
  }

  String getDecrytExecute(){
    List<int>? decSplitKey=digitSpliter(key!.codeUnits);
    List<int>? decKeyBasedOnSevenSegment=decimalBasedOnSevenSegment(decSplitKey);
    List<int>? afterXor,afterWrapping;
    List<int> decChipert=[];
    print('1');
    decChipert=decode(chiperteks!.codeUnits);
    try{
      decChipert=decode(chiperteks!.codeUnits);
      print(decChipert);
    }catch(e){
      print(e);
    }
    afterWrapping=wrappingBit(decChipert, 2);
    afterXor=xorStage(afterWrapping, decKeyBasedOnSevenSegment);
    return String.fromCharCodes(afterXor);
  }

  List<int> digitSpliter(List<int> data){
    List<int> result=[];
    int index=0;
    for(int i in data){
      String a=i.toString();
      for(int j=0;j<a.length;j++){
        result.add(int.parse(a[j]));
        index++;
      }
    }
    return result;
  }

  List<int> decimalBasedOnSevenSegment(List<int> data){
    List<int> result=[];
    for(int i in data){
      result.add(int.parse(getSevenSegment(i),radix: 2));
    }
    return result;
  }

  String getSevenSegment(int decimal){
    late String a;
    if(decimal==0){
      a='1111110';
    }
    else if(decimal==1){
      a='0110000';
    }
    else if(decimal==2){
      a='1101101';
    }
    else if(decimal==3){
      a='1111001';
    }
    else if(decimal==4){
      a='0110011';
    }
    else if(decimal==5){
      a='1011011';
    }
    else if(decimal==6){
      a='1011111';
    }
    else if(decimal==7){
      a='1110000';
    }
    else if(decimal==8){
      a='1111111';
    }else{
      a='1110011';
    }
    return a;
  }

  List<int> xorStage(List<int> data,List<int> key){
    List<int> result=[];
    int index_of_key=0;
    for(int i=0;i<data.length;i++){
      result.add(data[i]^key[index_of_key%key.length]);
      index_of_key++;
    }
    return result;
  }

  List<int> wrappingBit(List<int> a,int direction){
    List<int> result=[];
    if(direction==1){
      for(int i=0;i<a.length;i++){
        String binary=padding7Bit(a[i].toRadixString(2));
        String bin=''; 
        for(int j=1;j<binary.length;j++){
          bin+=binary[j];
        }
        bin+=binary[0];
        result.add(int.parse(bin, radix: 2));
      }
    }else{
      for(int i=0;i<a.length;i++){
        String binary=padding7Bit(a[i].toRadixString(2));
        String bin=''; 
        bin+=binary[binary.length-1];
        for(int j=0;j<binary.length-1;j++){
          bin+=binary[j];
        }
        result.add(int.parse(bin, radix: 2));
      }
    }
    return result;
  }

  String encode(List<int> data){
    String concatenate='';
    for(int i in data){
      Random r=Random();
      int result=modulo(i, 95)[0];
      int remainder=modulo(i, 95)[1];
      if(remainder+32>47 && remainder+32<58){
        concatenate+=result.toString()+String.fromCharCode(remainder+32);
      }else if(result>=1){
        concatenate+=(1+r.nextInt(8)).toString()+String.fromCharCode(remainder+32);
      }else{
        concatenate+=String.fromCharCode(remainder+32);
      }
    }
    return concatenate;
  }

  List<int> decode(List<int> data){
    int index=0;
    List<int> result=[];
    while(index<data.length){
      int i=data[index];
      if(i>47 && i<58){
        int rotate=int.parse(String.fromCharCode(i));
        if(rotate==0){
          result.add(data[index+1]-32);
          index+=2;
        }else{
          result.add((1*95)+data[index+1]-32);
          index+=2;
        }
      }else{
        result.add(data[index]-32);
        index++;
      }
    }
    return result;
  }


  List<int> modulo(int number,int devider){
    int index=0;
    while(number>=devider){
      number=number-devider;
      index++;
    }
    return [index,number];
  }
  String padding7Bit(String bit){
    String pad='';
    for(int i=0;i<7-bit.length;i++){
      pad+='0';
    }
    pad+=bit;
    return pad;
  } 
}