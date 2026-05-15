-- "some" means at least one, "one" means exactly one, "lone" means at most one, and "set" means zero or more.
-- This doesn't match our model exactly. Because I think gOCED needs some revisions.
-- atm it is possible for an endurant to be created and terminated by many events. Is this correct?
-- we have no temporal ordering. there is no restriction that says creation event must be before termination event.


module gOCED_Try01

sig Time {}

-- Because of "abstract" keyword, we can't have instances of ConcreteIndividual. We can only have instances of its subtypes.
-- Then every ConcreteIndividual must belong to one of its subtypes, such as Endurant, Event, or QVAS. 
-- Is this covered by gOCED?
abstract sig ConcreteIndividual {
    beginAt: lone Time,
    endAt: lone Time
}

sig EventType {}
abstract sig EndurantType {}
sig QualityType, ObjectType, RelatorType extends EndurantType{}

abstract sig Endurant extends ConcreteIndividual {
    -- These 2 realtions are based on gUFO document.
    -- Which means qualities can have creation and termination events. Is this correct?
    wasCreatedIn: set Event,
    wasTerminatedIn: set Event
}


sig Object extends Endurant {
    instanceOfOT: one ObjectType,
    participatedIn: set Event
}
sig Relator extends Endurant {
    instanceOfRT: one RelatorType,
    mediates: set (Endurant - Quality),

    -- The gUFO document says only objects participates in events but i disagree. 
    participatedIn: set Event
}

abstract sig Event extends ConcreteIndividual {
    OfEventType: one EventType,
    properPartOf: set ComplexEvent,
    broughtAbout: set QVAS,
    historicallyDependsOn: set Event
}
sig AtomicEvent extends Event {}
sig ComplexEvent extends Event {}

-- I won't include situation because in gOCED, we only use QVAS.
--sig Situation extends ConcreteIndividual {} 
sig QVAS extends ConcreteIndividual {
    concernsQT: one QualityType,
    contributeToTrigger: set Event,
    qvasHasQV: some QualityValue,
    standsIn: one (Object + Relator)
}

sig Quality extends Endurant {
    instanceOfQT: one QualityType,
    qHasQV: one QualityValue,
    inheresIn: one (ConcreteIndividual - Quality - QVAS) -- Is this covered by gOCED?
}
sig QualityValue{}

fact {
    -- This means that every atomic event has at most one point in time.
    -- It allows both beginAt and endAt if they are pointing to the same Time.
    -- So we are allowed to have evnets without time. IS THIS CORRECT?
    all ae: AtomicEvent | lone ae.beginAt + ae.endAt

    -- this means that each pair of events and objects can only be related by one of the three relations.
    all o: Object | 
    {no o.wasCreatedIn & o.wasTerminatedIn
    no o.wasCreatedIn & o.participatedIn
    no o.wasTerminatedIn & o.participatedIn}

    all r: Relator | 
    {no r.wasCreatedIn & r.wasTerminatedIn
    no r.wasCreatedIn & r.participatedIn
    no r.wasTerminatedIn & r.participatedIn}


    all q: Quality | no q.wasCreatedIn & q.wasTerminatedIn

    -- each relator mediates at least two endurants.
    all r:Relator | #r.mediates >= 2


    -- even if these are not covered by gOCED or gufo, it makes sense to have them.
    -- otherwise there will be a lot of types that are not used in our OCED.
    -- ontologically correct though.
    all et: EventType | some e: Event | e.OfEventType = et
    all ot: ObjectType | some o: Object | o.instanceOfOT = ot
    all rt: RelatorType | some r: Relator | r.instanceOfRT = rt

    -- Is this covered by gOCED?
    all qt: QualityType | (some q: Quality | q.instanceOfQT = qt)
    or (some s: QVAS | s.concernsQT = qt)

    -- An event can't be a proper part of itself. Is this covered by gOCED?
    all e: Event | e not in e.^properPartOf

    -- An event can't be historically dependent on itself. Is this covered by gOCED?
    all e: Event | e not in e.^historicallyDependsOn

    -- again, gOCED may not explicitly cover it but we don't want floating components. 
    all qv: QualityValue | (some q: Quality | q.qHasQV = qv) or (some s: QVAS | qv in s.qvasHasQV)

    -- relator can't mediate itself. Is this covered by gOCED?
    all r: Relator | r not in r.mediates

    -- if s triggers e, e doesn't brought about s. Is this covered by gOCED?
    all e: Event, s: QVAS | s in e.broughtAbout implies e not in s.contributeToTrigger

    -- Look at Random_gOCED_03.png.  
    all x: ConcreteIndividual - Quality - QVAS, qt: QualityType, qv: QualityValue |
    lone q: Quality |
        q.inheresIn = x
        and q.instanceOfQT = qt
        and q.qHasQV = qv

    
    -- Relator can't mediate between itself and other endurants. Is this covered by gOCED?
    all r: Relator | r not in r.mediates

    -- it basically forbids having 2 different QVAS that have everything in common.
    -- Is this covered by gOCED?
    all disj s1, s2: QVAS |
    not (
        s1.standsIn = s2.standsIn
        and s1.concernsQT = s2.concernsQT
        and s1.qvasHasQV = s2.qvasHasQV
        -- and s1.beginAt = s2.beginAt
        -- and s1.endAt = s2.endAt
    )
    
    -- a bearer cannot have the same quality type both statically and dynamically
    -- is it covered by gOCED?
    all q: Quality, s: QVAS |
    q.inheresIn = s.standsIn
    implies q.instanceOfQT != s.concernsQT
}

-------- EXAMPLE ---------
pred has_every_component {
    some Time

    some EventType
    some ObjectType
    some RelatorType
    some QualityType

    some Object
    some Relator
    some Quality

    some AtomicEvent
    some ComplexEvent

    some QVAS
    some QualityValue
}

run has_every_component for 10


assert EveryRelatorMediatesSomeObject {
    all r: Relator | some r.mediates & Object
}
check EveryRelatorMediatesSomeObject for 5

-------- Things to Consider ---------
-- 1. Should we make sure every componenet is connected to at least one other component? 
--    Otherwise we can have a lot of floating components that are not related to anything else. 
--    This is not ontologically correct, but it may be useful for testing purposes.

-- 2. should i allow an attribute to have two values or to have two attributes of the same type, each has one value?
--    gUFO document suggests the 2nd one (search ":JohnWeighs80Kgin2015" in gUFO document). 
--    But i beilieve the first makes more sense.

-- 3. Should we distinguish between static and dynamic quality types?
--    Does it make sense that a quality type can be both quality and QVAS?

-- 4. Is it mandatory for an event to be connected to at least one endurant?
-- i don't think it is the case from the ontological point of view but it may be the case for PM.

-- 5. We allow events to be timeless. Is it correct from PM point of view?

-- 6. we need to model o2o in a way simpler than relators. on the other hand, it may end up as an edge with qualifier agian.