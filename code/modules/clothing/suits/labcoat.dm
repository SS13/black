/obj/item/clothing/suit/storage/labcoat
	name = "labcoat"
	desc = "A suit that protects against minor chemical spills."
	icon_state = "labcoat"
	item_state = "labcoat"
	var/open = 0
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	allowed = list(/obj/item/device/analyzer,/obj/item/stack/medical,/obj/item/weapon/dnainjector,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/healthanalyzer,/obj/item/device/flashlight/pen)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

	verb/toggle()
		set name = "Toggle Labcoat Buttons"
		set category = "Object"
		set src in usr

		if (istype(src, /obj/item/clothing/suit/storage/labcoat/kimono))
			return 0

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if (open)
			src.icon_state = "[initial(icon_state)]"
			usr << "You button up the labcoat."
		else
			src.icon_state = "[initial(icon_state)]_open"
			usr << "You unbutton the labcoat."
		open = !open
		usr.update_inv_wear_suit()	//so our overlays update

/obj/item/clothing/suit/storage/labcoat/cmo
	name = "chief medical officer's labcoat"
	desc = "Bluer than the standard model."
	icon_state = "labcoat_cmo"
	item_state = "labcoat_cmo"

/obj/item/clothing/suit/storage/labcoat/mad
	name = "The Mad's labcoat"
	desc = "It makes you look capable of konking someone on the noggin and shooting them into space."
	icon_state = "labgreen"
	item_state = "labgreen"

/obj/item/clothing/suit/storage/labcoat/genetics
	name = "Geneticist Labcoat"
	desc = "A suit that protects against minor chemical spills. Has a blue stripe on the shoulder."
	icon_state = "labcoat_gen"

/obj/item/clothing/suit/storage/labcoat/chemist
	name = "Chemist Labcoat"
	desc = "A suit that protects against minor chemical spills. Has an orange stripe on the shoulder."
	icon_state = "labcoat_chem"

/obj/item/clothing/suit/storage/labcoat/virologist
	name = "Virologist Labcoat"
	desc = "A suit that protects against minor chemical spills. Offers slightly more protection against biohazards than the standard model. Has a green stripe on the shoulder."
	icon_state = "labcoat_vir"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 60, rad = 0)

/obj/item/clothing/suit/storage/labcoat/science
	name = "Scientist Labcoat"
	desc = "A suit that protects against minor chemical spills. Has a purple stripe on the shoulder."
	icon_state = "labcoat_tox"

/obj/item/clothing/suit/storage/labcoat/kimono
	name = "Medical Kimono"
	icon_state = "med_kimono"

/obj/item/clothing/suit/storage/labcoat/kimono/sci_kimono
	name = "Scientist Kimono"
	icon_state = "sci_kimono"

/obj/item/clothing/suit/storage/labcoat/blue
	name = "blue labcoat"
	icon_state = "labblue"

/obj/item/clothing/suit/storage/labcoat/orange
	name = "orange labcoat"
	icon_state = "laborange"

/obj/item/clothing/suit/storage/labcoat/red
	name = "red labcoat"
	icon_state = "labred"

/obj/item/clothing/suit/storage/labcoat/green
	name = "green labcoat"
	icon_state = "labgreen"


/obj/item/clothing/suit/storage/labcoat/purple
	name = "purple labcoat"
	icon_state = "labpurple"