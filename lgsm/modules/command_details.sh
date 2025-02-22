#!/bin/bash
# LinuxGSM command_details.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Displays server information.

commandname="DETAILS"
commandaction="Viewing details"
moduleselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
fn_firstcommand_set

# Run checks and gathers details to display.
check.sh
info_distro.sh
info_game.sh
info_messages.sh
if [ "${querymode}" == "2" ] || [ "${querymode}" == "3" ]; then
	for queryip in "${queryips[@]}"; do
		query_gamedig.sh
		if [ "${querystatus}" == "0" ]; then
			break
		fi
	done
fi
fn_info_message_distro
fn_info_message_server_resource
fn_info_message_gameserver_resource
fn_info_message_gameserver
fn_info_message_script
fn_info_message_backup
# Some game servers do not have parms.
if [ "${shortname}" != "jc2" ] && [ "${shortname}" != "dst" ] && [ "${shortname}" != "pz" ] && [ "${engine}" != "renderware" ]; then
	fn_info_message_commandlineparms
fi
fn_info_message_ports_edit
fn_info_message_ports
fn_info_message_select_engine
fn_info_message_statusbottom

exitcode=0
core_exit.sh
