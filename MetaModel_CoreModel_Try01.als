-- "some" means at least one, "one" means exactly one, "lone" means at most one, and "set" means zero or more.

module CoreModel_Try01

sig Time {}
sig EventAtt {}
sig EventType {}
-- sig Qualifier {} -- qualifiers for events observing objects.
sig ObjectAtt {}
sig ObjectType {}
--sig RelationType {} -- o2o types

sig EventAttributeValue {
	ValueOfEAtt: one EventAtt
	}

sig ObjectAttributeValue {
	ValueOfOAtt: one ObjectAtt
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
	ObservedAt: set Time,  --set is an Alloy multiplicity keyword. It means: zero, one, or many
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
  all e:Event | one t: Time | t in e.ObservedAt
  -- i removed this because CoreModel doesn't include this restriction. It should have though
  -- all t: Time | some e: Event | t in e.ObservedAt 

	all et: EventType | some e: Event | e.OfEventType = et

  -- this means that every EventAttributeValue is associated with exactly one Event.
  -- It is part of the CoreModel but i am not sure if it is correct.
	all eattv: EventAttributeValue | one e: Event |  eattv in e.eHas 

  -- this means that every EventAttribute is associated with at least one EventAttributeValue.
	all eatt: EventAtt | some eattv: EventAttributeValue | eattv.ValueOfEAtt = eatt
	
  
  --all e: Event, o:Object | some o.(e.observesQualifier) implies o in e.observes
	
	all ot: ObjectType | some o: Object | o.OfObjectType = ot

	all oattv: ObjectAttributeValue | one o: Object | oattv in o.oHas

	all oatt: ObjectAtt | some oattv: ObjectAttributeValue | oattv.ValueOfOAtt = oatt

	-- all rt: RelationType | some o1: Object, o2: Object | rt in o2.(o1.oRelationQualifier)
	-- all o1:Object, o2:Object | some o2.(o1.oRelationQualifier) implies o2 in o1.oRelation
	-- all q: Qualifier | some e: Event, o: Object | o -> q in e.observesQualifier
	-- all q: Qualifier | some e2o: EventObjectRelation | e2o.qualifier = q
	-- all rt: RelationType |some r: ObjectRelation | r.relationType = rt
	}

	run {} for 2
