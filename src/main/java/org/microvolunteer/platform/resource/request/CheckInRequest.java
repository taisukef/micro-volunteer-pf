package org.microvolunteer.platform.resource.request;

import lombok.Data;

@Data
public class CheckInRequest {
    private String token;
    private String x_geometry;
    private String y_geometry;
}