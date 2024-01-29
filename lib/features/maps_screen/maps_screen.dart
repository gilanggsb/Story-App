import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => mapsProvider,
      child: DefaultScaffold(
        appBar: DefaultAppBar(
          title: 'Maps',
          actions: widget.mapsScreenModel.isPreviewMode
              ? null
              : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultText(
                      'Simpan',
                      color: AppColors.blackColor,
                      onTap: mapsProvider.saveLocation,
                    ),
                  )
                ],
        ),
        body: Consumer<MapsProvider>(
          builder: (context, value, child) => FlutterMap(
            mapController: mapsProvider.mapController,
            options: MapOptions(
              initialCenter:
                  widget.mapsScreenModel.latLng ?? mapsProvider.latLong,
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
                      onPressed: mapsProvider.getUserLocation,
                      child: const Icon(Icons.location_searching_outlined),
                    ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point:
                        widget.mapsScreenModel.latLng ?? mapsProvider.latLong,
                    width: 100,
                    height: 100,
                    child: MyTooltip(
                      message:
                          MapsUtil.convertToAddress(mapsProvider.placemark),
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
        ),
      ),
    );
  }
}
