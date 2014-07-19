Mappers Tests
=============

Testing performance of different mapping engines:

- [Mantle](https://github.com/Mantle/Mantle)
- [Isaak](https://github.com/linkedin/Isaac)
- [FastEasyMapping](https://github.com/Yalantis/FastEasyMapping)

## Mods to Mappers
- Isaak: Ability to map `NSString` -> `NSNumber` - Speed dropped by 3%
- FastEasyMapping: `NSString` -> `NSNumber`, `NSNumber` -> `NSString` - Speed dropped by 20%

## Test results

- Run by Xcode 6, 10 times x 10000 loops
- Mapping NSDictionary to NSObject

| Mapper          | Map 1, s |
| --------------- |:--------:|
| Mantle          | 0.990    |
| Isaak           | 0.830    |
| FastEasyMapping | 0.669    |

![](http://chart.googleapis.com/chart?cht=bvs&chs=250x130&chds=a&chxt=y&chbh=20,20,20&chco=FFC6A5|FFFF42|DEF3BD|00A5C6|DEBDDE&chd=t:0.990,0.830,0.669&chdl=Mantle|Isaak|FEM)

Feel free to propose more tests
