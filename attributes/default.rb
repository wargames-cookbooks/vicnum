# This source file is part of Vicnum's chef cookbook.
#
# Vicnum's chef cookbook is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Vicnum's chef cookbook is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with Vicnum's chef cookbook. If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.

# Vicnum application
default["vicnum"]["version"] = "vicnum15"
default["vicnum"]["path"]    = "/opt/vicnum"

# Apache2 configuration
default["vicnum"]["server_name"] = "vicnum"
default["vicnum"]["server_aliases"] = [ "vicnum" ]
