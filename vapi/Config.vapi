/*
 * Config.vapi
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


[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "config.h")]
namespace Config {
	public const string VERSION;
	public const string SYSCONFDIR;
}

