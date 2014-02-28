
/obj/structure/closet/malf/suits
	desc = "It's a storage unit for operational gear."
	icon_state = "syndicate"
	icon_closed = "syndicate"
	icon_opened = "syndicateopen"

/obj/structure/closet/malf/suits/New()
	..()
	sleep(2)
	new /obj/item/weapon/tank/jetpack/void(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/head/helmet/space/nasavoid(src)
	new /obj/item/clothing/suit/space/nasavoid(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/cell(src)
	new /obj/item/device/multitool(src)

/obj/structure/closet/malf/module
	desc = "It's a storage unit for operational gear."
	icon_state = "right-closed"
	icon_closed = "right-closed"
	icon_opened = "right-open"

/obj/structure/closet/malf/module/New()
	..()
	sleep(2)
	new /obj/item/weapon/aiModule/safeguard(src)
	new /obj/item/weapon/aiModule/oneHuman(src)
	new /obj/item/weapon/aiModule/protectStation(src)
	new /obj/item/weapon/aiModule/teleporterOffline(src)
	new /obj/item/weapon/aiModule/quarantine(src)
	new /obj/item/weapon/aiModule/oxygen(src)
	new /obj/item/weapon/aiModule/freeform(src)
	new /obj/item/weapon/aiModule/reset(src)
	new /obj/item/weapon/aiModule/purge(src)
	new /obj/item/weapon/aiModule/asimov(src)
	new /obj/item/weapon/aiModule/nanotrasen(src)
	new /obj/item/weapon/aiModule/corp(src)
	new /obj/item/weapon/aiModule/paladin(src)
	new	/obj/item/weapon/aiModule/robocop(src)
	new	/obj/item/weapon/aiModule/antimov(src)