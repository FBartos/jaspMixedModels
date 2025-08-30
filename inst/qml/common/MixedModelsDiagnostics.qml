//
// Copyright (C) 2013-2024 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//
import QtQuick
import QtQuick.Layouts
import JASP
import JASP.Controls

Section
{
	title: qsTr("Diagnostics")
	expanded: false

	Group
	{
		title: qsTr("Model assumptions")

		CheckBox
		{
			name: "diagNormality"
			label: qsTr("Normality of residuals")
		}

		CheckBox
		{
			name: "diagHomoscedasticity"
			label: qsTr("Homoscedasticity")
		}

		CheckBox
		{
			name: "diagOutliers"
			label: qsTr("Outliers")
		}

		CheckBox
		{
			name: "diagInfluential"
			label: qsTr("Influential observations")
		}
	}

	Group
	{
		title: qsTr("Multicollinearity")

		CheckBox
		{
			name: "diagVif"
			id: diagVif
			label: qsTr("Variance inflation factors (VIF)")
		}

		DoubleField
		{
			name: "diagVifThreshold"
			label: qsTr("VIF threshold")
			defaultValue: 3.0
			min: 1.0
			max: 10.0
			enabled: diagVif.checked
			info: qsTr("Values above this threshold indicate problematic multicollinearity")
		}

		CheckBox
		{
			name: "diagVifWarning"
			label: qsTr("Show warnings for high VIF")
			enabled: diagVif.checked
			checked: true
		}
	}

	Group
	{
		title: qsTr("Model performance")

		CheckBox
		{
			name: "diagR2"
			label: qsTr("R-squared values")
		}

		CheckBox
		{
			name: "diagICC"
			label: qsTr("Intraclass correlation coefficient (ICC)")
		}

		CheckBox
		{
			name: "diagRMSE"
			label: qsTr("Root mean square error (RMSE)")
		}

		CheckBox
		{
			name: "diagModelComparison"
			label: qsTr("Model comparison metrics")
		}
	}

	Group
	{
		title: qsTr("Residual plots")

		CheckBox
		{
			name: "diagPlotResiduals"
			id: diagPlotResiduals
			label: qsTr("Residuals vs fitted values")
		}

		CheckBox
		{
			name: "diagPlotQQ"
			label: qsTr("Q-Q plot of residuals")
		}

		CheckBox
		{
			name: "diagPlotScale"
			label: qsTr("Scale-location plot")
		}

		CheckBox
		{
			name: "diagPlotLeverage"
			label: qsTr("Leverage plot")
		}
	}
}