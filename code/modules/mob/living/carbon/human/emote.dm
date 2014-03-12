/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null, var/cooldown = 2)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's  unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle)
	//var/m_type = 1

	for (var/obj/item/weapon/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2.0 && (act != "deathgasp"))
		return
	if(emote_cooldown > 0)
		return
	switch(act)
		if ("airguitar")
			if (!src.restrained())
				message = "<B>[src]</B> бренчит по воздуху и дергает головой, как дикая обезьяна."
				m_type = 1

		if ("blink")
			message = "<B>[src]</B> моргает."
			m_type = 1

		if ("blink_r")
			message = "<B>[src]</B> быстро моргает."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "<B>[src]</B> кланяется [param]."
				else
					message = "<B>[src]</B> кланяется."
			m_type = 1

		if ("custom")
			var/input = copytext(sanitize(input("Choose an emote to display.") as text|null),1,MAX_MESSAGE_LEN)
			if (!input)
				return
			var/input2 = input("Это видимая или звуковая эмоция?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = 2
			else
				alert("Невозможно использовать эту эмоцию, она должна быть видимая или слышимая.")
				return
			return custom_emote(m_type, message)

		if ("me")
			if(silent)
				return
			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					src << "\red You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "<B>[src]</B> отдает честь [param]."
				else
					message = "<B>[src]</b> салютует."
			m_type = 1

		if ("choke")
			if(miming)
				message = "<B>[src]</B> отчаянно хватается за горло!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> задыхается!"
					m_type = 2
				else
					message = "<B>[src]</B> издает сильный шум."
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "<B>[src]</B>  хлопает."
				m_type = 2
				if(miming)
					m_type = 1
		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает крыльями."
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> ЗЛОБНО хлопает крыльями!"
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "<B>[src]</B> пускает слюни."
			m_type = 1

		if ("eyebrow")
			message = "<B>[src]</B> поднимает бровь."
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "<B>[src]</B> начинает хихикать."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> хихикает."
					m_type = 2
				else
					message = "<B>[src]</B> шумит."
					m_type = 2

		if ("twitch")
			message = "<B>[src]</B> яростно дергается."
			m_type = 1

		if ("twitch_s")
			message = "<B>[src]</B> дергается."
			m_type = 1

		if ("faint")
			message = "<B>[src]</B> падает в обморок."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "<B>[src]</B> начинает кашлять!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> кашляет!"
					m_type = 2
				else
					message = "<B>[src]</B> издает сильный шум."
					m_type = 2

		if ("frown")
			message = "<B>[src]</B> хмурится."
			m_type = 1

		if ("nod")
			message = "<B>[src]</B> кивает."
			m_type = 1

		if ("blush")
			message = "<B>[src]</B> краснеет."
			m_type = 1

		if ("wave")
			message = "<B>[src]</B> шатается."
			m_type = 1

		if ("gasp")
			if(miming)
				message = "<B>[src]</B>  по видимому, задыхается!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> задыхается!"
					m_type = 2
				else
					message = "<B>[src]</B> издает слабый шум."
					m_type = 2

		if ("deathgasp")
			message = "<B>[src]</B> seizes up and falls limp, \his eyes dead and lifeless..."
			m_type = 1

		if ("giggle")
			if(miming)
				message = "<B>[src]</B> тихо хихикает!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> хихикает."
					m_type = 2
				else
					message = "<B>[src]</B> шумит."
					m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "<B>[src]</B> пялится на [param]."
			else
				message = "<B>[src]</B> смотрит."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "<B>[src]</B> наблюдает за [param]."
			else
				message = "<B>[src]</B> наблюдает."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "<B>[src]</B> смотрит на [param]."
			else
				message = "<B>[src]</B> смотрит."
			m_type = 1

		if ("grin")
			message = "<B>[src]</B> скалит зубы."
			m_type = 1

		if ("cry")
			if(miming)
				message = "<B>[src]</B> плачет."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> плачет."
					m_type = 2
				else
					message = "<B>[src]</B> издает слабый шум."// \He frowns.
					m_type = 2

		if ("sigh")
			if(miming)
				message = "<B>[src]</B> вздыхает."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> охает."
					m_type = 2
				else
					message = "<B>[src]</B> издает слабый шум."
					m_type = 2

		if ("laugh")
			if(miming)
				message = "<B>[src]</B> издает смешок."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> смеется."
					m_type = 2
				else
					message = "<B>[src]</B> шумит."
					m_type = 2

		if ("mumble")
			message = "<B>[src]</B> бормочет!"
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "<B>[src]</B> ворчит!"
				m_type = 1
			if (!muzzled)
				message = "<B>[src]</B> ворчит!"
				m_type = 2
			else
				message = "<B>[src]</B> шумит."
				m_type = 2

		if ("groan")
			if(miming)
				message = "<B>[src]</B> издает стон!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> cтонет!"
					m_type = 2
				else
					message = "<B>[src]</B> издает громкий шум."
					m_type = 2

		if ("moan")
			if(miming)
				message = "<B>[src]</B>  начинает стонать!"
				m_type = 1
			else
				message = "<B>[src]</B> стонет от наслаждения!"
				m_type = 2

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				if(miming)
					message = "<B>[src]</B>  затягивается сигаретой и выдыхает дым \"[M]\" в дыму."
					m_type = 1
				else
					message = "<B>[src]</B> says, \"[M], please. He had a family.\" [src.name] затягивается сигаретой и выдувает свое имя."
					m_type = 2

		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "<B>[src]</B> тычет пальцем."
				else
					M.point()

				if (M)
					message = "<B>[src]</B> показывает на [M]."
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "<B>[src]</B> поднимает руки."
			m_type = 1

		if("shake")
			message = "<B>[src]</B> трясет головой."
			m_type = 1

		if ("shrug")
			message = "<B>[src]</B> пожимает плечами."
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "<B>[src]</B> поднимает [t1] пальцев."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "<B>[src]</B> поднимает [t1] пальцев."
			m_type = 1

		if ("smile")
			message = "<B>[src]</B> улыбается."
			m_type = 1

		if ("shiver")
			message = "<B>[src]</B> вздрагивает."
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "<B>[src]</B> бледнеет на секунду."
			m_type = 1

		if ("tremble")
			message = "<B>[src]</B> дрожит в страхе!"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "<B>[src]</B> чихает."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> чихает."
					m_type = 2
				else
					message = "<B>[src]</B> издает странный шум."
					m_type = 2

		if ("sniff")
			message = "<B>[src]</B> нюхает."
			m_type = 2
			if(miming)
				m_type = 1

		if ("snore")
			if (miming)
				message = "<B>[src]</B> громко сопит."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> храпит."
					m_type = 2
				else
					message = "<B>[src]</B> шумит."
					m_type = 2

		if ("whimper")
			if (miming)
				message = "<B>[src]</B> стонет от боли."
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> хнычет."
					m_type = 2
				else
					message = "<B>[src]</B> издает слабый шум."
					m_type = 2

		if ("wink")
			message = "<B>[src]</B> подмигивает."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "<B>[src]</B> зевает."
				m_type = 2
				if(miming)
					m_type = 1

		if ("collapse")
			Paralyse(2)
			message = "<B>[src]</B> падает!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "<B>[src]</B> обнимает [M]."
				else
					message = "<B>[src]</B> обнимает себя."

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "<B>[src]</B> пожимает руку [M]."
					else
						message = "<B>[src]</B> протягивает руку [M]."

		if("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "<B>[src]</B> даёт пощёчину [M]."
				else
					message = "<B>[src]</B> разочаровавшись что не может найти кому дать пощёчину даёт пощёчину себе. Позорище." // Translate it 3010

		if ("scream")
			if (miming)
				message = "<B>[src]</B> кричит!"
				m_type = 1
			else
				if (!muzzled)
					message = "<B>[src]</B> кричит!"
					call_sound_emote("scream")
					m_type = 2
				else
					message = "<B>[src]</B> издает очень громкий шум."
					m_type = 2

		if ("help")
			src << "blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough,\ncry, custom, deathgasp, drool, eyebrow, frown, gasp, giggle, groan, grumble, handshake, hug-(none)/mob, glare-(none)/mob,\ngrin, laugh, look-(none)/mob, moan, mumble, nod, pale, point-atom, raise, salute, shake, shiver, shrug,\nsigh, signal-#1-10, smile, sneeze, sniff, snore, stare-(none)/mob, tremble, twitch, twitch_s, whimper,\nwink, yawn"

		else
			message = "<B>[src]</B> [act]."
			cooldown = 0





	if (message)
		message = sanitize_russian(message)
		log_emote("[name]/[key] : [message]")

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in dead_mob_list)
			if(!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers and new players
			if(M.stat == DEAD && (M.client.prefs.toggles & CHAT_GHOSTSIGHT) && !(M in viewers(src,null)))
				M.show_message(message)


		if (m_type & 1)
			for (var/mob/O in get_mobs_in_view(world.view,src))
				O.show_message(message, m_type)
		else if (m_type & 2)
			for (var/mob/O in (hearers(src.loc, null) | get_mobs_in_view(world.view,src)))
				O.show_message(message, m_type)

	emote_cooldown += cooldown

/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	pose = copytext(sanitize_uni(input(usr, "This is [src]. \He is...", "Pose", null)  as text), 1, MAX_MESSAGE_LEN)

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavour Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	flavor_text =  copytext(sanitize(input(usr, "Please enter your new flavour text.", "Flavour text", null)  as text), 1)

/mob/living/carbon/human/proc/call_sound_emote(var/E)
	switch(E)
		if("scream")
			for(var/mob/M in viewers(usr, null))
				if (src.gender == "male")
					M << sound(pick('sound/voice/Screams_Male_1.ogg', 'sound/voice/Screams_Male_2.ogg', 'sound/voice/Screams_Male_3.ogg'))
				else
					M << sound(pick('sound/voice/Screams_Woman_1.ogg', 'sound/voice/Screams_Woman_2.ogg', 'sound/voice/Screams_Woman_3.ogg'))

