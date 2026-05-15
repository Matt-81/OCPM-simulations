-- "some" means at least one, "one" means exactly one, "lone" means at most one, and "set" means zero or more.

module OCELv2_Try01

sig Time {}
sig EventAtt {}
sig EventType {
    EThasAtt: set EventAtt
}
-- sig Qualifier {} -- qualifiers for events observing objects.
sig ObjectAtt {}
sig ObjectType {
    OThasAtt: set ObjectAtt
}
--sig RelationType {} -- o2o types

sig EventAttributeValue {
	ValueOfEAtt: one EventAtt
	}

sig ObjectAttributeValue {
	ValueOfOAtt: one ObjectAtt,
    hasTime: one Time
	}

sig Object {
	OfObjectType: one ObjectType,
	oRelation: set Object,
	--oRelationQualifier: Object -> lone RelationType,
	oHas: set ObjectAttributeValue
	}

--  sig ObjectRelation {
--	source: one Object,
--	target: one Object,
--	relationType: lone RelationType
--}

sig Event {
	ObservedAt: one Time,  
	eHas: set EventAttributeValue,
	OfEventType: one EventType,
	observes: set Object,
	-- observesQualifier: Object -> lone Qualifier
	}


--sig EventObjectRelation {
--	ev: one Event,
--	obj: one Object,
--	qualifier: lone Qualifier
--}




fact {
  -- i removed this because OCELv2 doesn't include this restriction. It should have though
  -- all t: Time | some e: Event | t in e.ObservedAt 

  -- i removed this because OCELv2 doesn't include this restriction. It should have though
  -- all et: EventType | some e: Event | e.OfEventType = et 

  -- this means that every EventAttributeValue is associated with exactly one Event.
  -- It is part of the CoreModel but i am not sure if it is correct.
	all eattv: EventAttributeValue | one e: Event |  eattv in e.eHas 


  -- i removed this because OCELv2 doesn't include this restriction. It should have though
  -- maybe because every attribute needs to be connected to atleast one TYPE!
  -- this means that every EventAttribute is associated with at least one EventAttributeValue.
  -- all eatt: EventAtt | some eattv: EventAttributeValue | eattv.ValueOfEAtt = eatt
	
	-- i removed this because OCELv2 doesn't include this restriction. It should have though
	-- all ot: ObjectType | some o: Object | o.OfObjectType = ot

	all oattv: ObjectAttributeValue | one o: Object | oattv in o.oHas

    -- i removed this because OCELv2 doesn't include this restriction. It should have though
	-- all oatt: ObjectAtt | some oattv: ObjectAttributeValue | oattv.ValueOfOAtt = oatt

    -- only for OCELv2
    all oAtt: ObjectAtt | one ot:ObjectType | oAtt in ot.OThasAtt
    all eAtt: EventAtt | one et:EventType | eAtt in et.EThasAtt

    all e: Event, v: e.eHas | v.ValueOfEAtt in e.OfEventType.EThasAtt

    all o: Object, v: o.oHas | v.ValueOfOAtt in o.OfObjectType.OThasAtt

    all e: Event, a: EventAtt | lone v: e.eHas | v.ValueOfEAtt = a

    all o: Object, a: ObjectAtt, t: Time |
	lone v: o.oHas | v.ValueOfOAtt = a and v.hasTime = t
	}

    

	run {} for 2


--------------------
-- DOMAIN EXAMPLE --
--------------------


