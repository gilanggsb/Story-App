import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'components/fluttermap_zoom_buttons.dart';
import 'utils/utils.dart';
import '../../common/common.dart';
import 'controllers/controllers.dart';
import 'data/data.dart';

class MapsScreen extends StatefulWidget {
  final MapsScreenModel mapsScreenModel;
  const MapsScreen({super.key, required this.mapsScreenModel});

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  final MapsProvider mapsProvider = MapsProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.mapsScreenModel.latLng == null) return;
      mapsProvider.getCurrentLocation(widget.mapsScreenModel.latLng!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    mapsProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        title: 'Maps',
        actions: widget.mapsScreenModel.isPreviewMode
            ? null
            : [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DefaultText(
                      'Simpan',
                      color: AppColors.blackColor,
                    ),
                  ),
                )
              ],
      ),
      body: FlutterMap(
        mapController: mapsProvider.mapController,
        options: MapOptions(
          initialCenter:
              widget.mapsScreenModel.latLng ?? const LatLng(50.5, 30.51),
          initialZoom: 5,
          maxZoom: 20,
          minZoom: 1,
          keepAlive: true,
        ),
        children: [
          TileLayer(
            urlTemplate: "${URL.mapsUrl}?api_key={api_key}",
            additionalOptions: {"api_key": URL.mapsApiKey},
            maxZoom: 20,
            maxNativeZoom: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterMapZoomButtons(
                controller: mapsProvider.mapController,
                zoomOutColor: AppColors.whiteColor,
                zoomInColor: AppColors.whiteColor,
              ),
              if (!widget.mapsScreenModel.isPreviewMode)
                FloatingActionButton(
                  heroTag: 'currentLocationButton',
                  mini: true,
                  backgroundColor: AppColors.whiteColor,
                  onPressed: () {},
                  child: const Icon(Icons.location_searching_outlined),
                ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point:
                    widget.mapsScreenModel.latLng ?? const LatLng(50.5, 30.51),
                width: 100,
                height: 100,
                child: MyTooltip(
                  message: MapsUtil.convertToAddress(mapsProvider.placemark),
                  child: const Icon(
                    Icons.location_pin,
                    color: AppColors.whiteColor,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
