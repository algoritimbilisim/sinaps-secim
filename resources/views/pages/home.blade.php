@extends('layouts.master')

@section('content')

    <body id="top" class="{{ setting('site.theme') }}">
        <main class="container-fluid">
            <div class="card mt-2" style="background: #33375f;">
                <div class="card-body">
                    <div class="row display-6 fw-bold text-center">
                        <div class="col-12 col-md-3 bg-transparent text-white border-0 card d-flex justify-content-between">
                            <div>Açılan Sandık Sayısı</div>
                            <div>{{ $totalOpenedVoteCases }}</div>
                        </div>
                        <div class="col-12 col-md-3 bg-transparent text-white border-0 card d-flex justify-content-between">
                            <div>Açılan Sandık Oranı</div>
                            <div>{{ $totalVoteCasesRatio }}%</div>
                        </div>
                        <div class="col-12 col-md-3 bg-transparent text-white border-0 card d-flex justify-content-between">
                            <div>Geçerli Oy Sayısı</div>
                            <div>{{ $validVoteCount }}</div>
                        </div>
                        <div class="col-12 col-md-3 bg-transparent text-white border-0 card d-flex justify-content-between">
                            <div>Geçersiz Oy Sayısı</div>
                            <div>{{ $nonvalidVoteCount }}</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row display-6 fw-bold text-center mt-4 p-3">
                @foreach ($selectedVotes as $key => $vote)
                    <div class="col-12 col-lg-4 col-xl-3 @if ($key == 3) d-none d-xl-block @endif">
                        <div class="card mb-3 text-white" style="background: #33375f">
                            <div class="d-flex g-0">
                                <div>
                                    <div class="bg-white"
                                        style="width: 120px;height: 120px;border-radius:.5rem;margin:10px;overflow:hidden;padding:5px;">
                                        <img style="object-fit:contain;height:100%"
                                            src="{{ '/storage/' . $vote->party->logo_url }}" alt="...">
                                    </div>
                                </div>
                                <div class="flex-fill">
                                    <div class="card-body">
                                        <p class="card-text">Oy Sayısı</p>
                                        <p class="card-text">{{ $vote->vote_count }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div id="chart" style="width: 100%;height:500px;"></div>

        </main>

        <script type="text/javascript">
            var data = @php echo $chartVotes; @endphp;
            var totalVotes = @php echo $totalVotes; @endphp;

            // ECharts'ta kullanılacak veri
            var xAxisData = [];
            var seriesData = [];
            let rich = {};
            let filteredData = [];

            data.forEach(function(item) {
                if (item.party_id) {
                    xAxisData.push(item.party.name);
                    seriesData.push(item.vote_count);

                    rich[item.party_id] = {
                        align: 'center',
                        backgroundColor: {
                            image: "/storage/" + item.party.logo_url
                        },
                        height: 100
                    };
                    filteredData.push({
                        party_id: item.party_id,
                        vote_count: item.vote_count
                    })
                }
            });

            // ECharts grafiği oluşturma
            var myChart = echarts.init(document.getElementById('chart'));

            var option = {
                grid: {
                    left: 50,
                    top: 150,
                    right: 50,
                    bottom: 50
                },
                xAxis: {
                    type: 'category',
                    data: xAxisData
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: seriesData,
                    type: 'bar',
                    color: "#33375f",
                    label: {
                        show: true,
                        position: 'top',
                        formatter: function(params) {
                            var dataIndex = params.dataIndex;
                            var item = filteredData[dataIndex];
                            return '{' + item.party_id + '|}\n\n{a|' +
                                item.vote_count + ' [' + (item.vote_count * 100 / totalVotes)
                                .toFixed(1) + '%]}';
                        },
                        rich: {
                            a: {
                                color: 'black',
                                fontSize: 26,
                                fontWeight: "bold",
                                align: 'center',
                            },
                            ...rich
                        }
                    }
                }]
            };

            // Grafiği çizme
            myChart.setOption(option);

            setInterval(() => {
                location.reload();
            }, 30 * 1000);
        </script>

        @stack('styles')
        @stack('scripts')

    </body>
@endsection
