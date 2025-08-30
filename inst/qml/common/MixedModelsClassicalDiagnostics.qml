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
	title:		qsTr("Diagnostics")
	expanded:	false

	Group
	{
		CheckBox
		{
			name:	"diagnosticsPredictedVsResiduals"
			label:	qsTr("Predicted vs Residuals plot")
			info:	qsTr("Plot of predicted values against residuals to check for homoscedasticity and linearity assumptions.")
		}

		CheckBox
		{
			name:	"diagnosticsResidualsVsPredictors"  
			label:	qsTr("Residuals vs Predictors plot")
			info:	qsTr("Plot of residuals against each predictor variable used in the model.")
		}

		CheckBox
		{
			name:	"diagnosticsHistogramResiduals"
			label:	qsTr("Histogram of Residuals")
			info:	qsTr("Histogram of model residuals to assess normality assumption.")
		}

		CheckBox
		{
			name:	"diagnosticsQQResiduals"
			label:	qsTr("QQ plot of Residuals")
			info:	qsTr("Quantile-quantile plot of residuals against normal distribution to check normality assumption.")
		}
	}
}
