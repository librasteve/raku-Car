#!/usr/bin/env raku
use v6.d;

use Physics::Measure :ALL;

#my %th := %Physics::Unit::type-hints;
#%th<Area>:delete;
#%th<FuelConsumption> = <Area FuelConsumption>;

class Car {
    has Mass $.mass;
    has Volume $.cc;
    has Power $.hp;
    has FuelConsumption() $.burn;     #() coerce to correct type

    method gist {
        "Car.new: mass => $.mass, cc => $.cc, hp => $.hp, burn => $.burn";
    }

    method agility(--> SpecificPower) {
        $.hp / $.mass;
    }

    method efficiency(--> FuelConsumption) {
        $.burn;
    }

    method ea-rating {
        $.efficiency * $.agility;
    }

}


my $vw-golf1 = Car.new: :mass(800kg), :cc(1.8l), :hp(♎️<112 hp>), :burn(♎️<10 l/100km>);
my $vw-golf8 = Car.new: :mass(1450kg),:cc(1.0l), :hp(♎️<110 hp>), :burn(♎️<4.6 l/100km>);

dd ♎️<10 l/100km>;
dd $vw-golf1.burn;

say $vw-golf1.agility;
say $vw-golf8.efficiency;
#say $vw-golf8.ea-rating;    #wip