/*
 * main.vala
 * This file is part of ledborg-client
 *
 * Copyright (C) 2013 - Ross Taylor
 *
 * ledborg-client is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * ledborg-client is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with ledborg-client. If not, see <http://www.gnu.org/licenses/>.
 */


using GLib;
using LedBorg;


namespace LedBorg {

	public class Main : Object
	{
	
		private static LedBorgClient client;


		private static bool _show_version = false;
		private static string _operation = "";
		
		private static int server_port = 9999;
		private static string server_host = "";
		private static string colour = "";
		
		
		private const OptionEntry[] options = {
			{"port", 'p', 0, OptionArg.INT, ref server_port, "Specify which port to connect on", null},
			{"host", 'h', 0, OptionArg.STRING, ref server_host, "Specify the LedBorg server to connect to", "HOSTNAME or IPADDRESS"},
			{"colour", 'c', 0, OptionArg.STRING, ref colour, "Specify the colour to send to the server", "LEDBORG COLOUR TRIPLET"},
			{"operation", 'o', 0, OptionArg.STRING, ref _operation, "Operation to perform", "get/set"},
			{"version", 'V', 0, OptionArg.NONE, ref _show_version, "Show version information", null},
			{null}
		};


		public Main ()
		{
		}


		static int main (string[] args)
		{
			// handle options
			try {
				var opt = new OptionContext("");
				opt.set_summary("LedBorg Client %s is a simple command-line client that allows\n network control of an LedBorg add-on for the Raspberry Pi\n by talking to LedBorg Server".printf(Config.VERSION));
				opt.set_help_enabled(true);
				opt.add_main_entries(options, null);
				opt.parse(ref args);
			}
			catch(GLib.Error e) {
				GLib.stderr.printf("Error: %s\n", e.message);
				GLib.stderr.printf("Run '%s --help' to see a full list of available options\n", args[0]);
				return 1;
			}

			// show version information
			if(_show_version)
			{
				stdout.printf("LedBorg Client version %s\n", Config.VERSION);
				stdout.printf("operation = %s\n", _operation);
				stdout.printf("colour = %s\n", colour);
				stdout.printf("host = %s\n", server_host);
				stdout.printf("port = %i\n", server_port);
				
				return 0;
			}


			if(_operation.down() == "get" || _operation.down() == "set")
			{
				client = new LedBorgClient(server_host, (uint) server_port);
				
				if(_operation.down() == "get")
				{
					operation_get_colour();
				}
			}

			return 0;
		}


		public static void operation_get_colour()
		{
			Colour colour = client.get_colour_from_server();
			stdout.printf("%s\n", colour.get_ledborg_value());
		}

	}	

}
