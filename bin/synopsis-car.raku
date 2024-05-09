#!/usr/bin/env raku
use v6.d;

use Physics::Measure :ALL;

my %th := %Physics::Unit::type-hints;
%th<Area>:delete;
%th<FuelConsumption> = <Area FuelConsumption>;

$Physics::Measure::round-to = 0.1;

class Car {
    has Mass $.mass;
    has Volume $.cc;
    has Power $.hp;
    has FuelConsumption $.burn;

    method gist {
        "Car.new: mass => $!mass, cc => $!cc, hp => $!hp, burn => $!burn";
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


#say my %vw-golf1=(:mass(800kg), :cc(1.8l),:hp(♎️<112 hp>),:burn(♎️<10 l/100km>));
#say my %vw-golf8=(:mass(1450kg),:cc(1.0l),:hp(♎️<110 hp>),:burn(♎️<4.6 l/100km>));

my $vw-golf1 = Car.new: :mass(800kg), :cc(1.8l), :hp(♎️<112 hp>), :burn(♎️<10 l/100km>);
my $vw-golf8 = Car.new: :mass(1450kg),:cc(1.0l), :hp(♎️<110 hp>), :burn(♎️<4.6 l/100km>);

say $vw-golf1.agility;
say $vw-golf8.efficiency;
#say $vw-golf8.ea-rating;    #wip