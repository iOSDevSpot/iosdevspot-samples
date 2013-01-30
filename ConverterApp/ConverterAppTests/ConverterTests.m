#import "Kiwi.h"
#import "Converter.h"

SPEC_BEGIN(ConverterTests)

describe(@"Testes do conversor", ^{
    context(@"Testes relacionado a classe de conversao de metros", ^{
        __block Converter *converter;
        
        beforeAll(^{
            converter = [[Converter alloc] init];
        });
        
        it(@"deveria retornar 100.0f cm", ^{        
            float cm = [converter metrosParaCentimetros:1];
                
            [[theValue(cm) should] equal:theValue(100.0f)];
            
        });
        
        it(@"não deve retornar 0", ^{
            
            float cm = [converter metrosParaCentimetros:200];
            
            [[theValue(cm) shouldNot] equal:theValue(0)];
        });
    });
    
    context(@"Testes para conversao de polegadas", ^{
        pending_(@"deveria retornar 30 cm", ^{});
    });

});


SPEC_END