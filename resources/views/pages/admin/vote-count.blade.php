@extends('voyager::master')

@section('content')
    <style>
        .table>tbody>tr>td,
        .table>tbody>tr>th,
        .table>tfoot>tr>td,
        .table>tfoot>tr>th,
        .table>thead>tr>td,
        .table>thead>tr>th {
            vertical-align: middle;
        }
    </style>
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                Lütfen Sandık No Seçiniz
                <select name="" id="case_no" onchange="getVotes()" class="form-control">
                    <option value="" disabled>Sandık Seç</option>
                    @foreach ($voteCases as $voteCase)
                        <option>{{ $voteCase['case_no'] }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="card" style="margin-top:1rem;">
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Logo</th>
                            <th>Parti Adı</th>
                            <th>Oy Sayısı</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="votes">
                            <td hidden class="party_id">0</td>
                            <td>
                                <img src="/images/invalid.png" alt="" height="50" width="50">
                            </td>
                            <td class="party_name">Geçersiz</td>
                            <td>
                                <input type="number" class="vote_count form-control" id="vote_count0" value="0">
                            </td>
                        </tr>
                        @foreach ($parties as $party)
                            <tr class="votes">
                                <td hidden class="party_id">{{ $party['id'] }}</td>
                                <td>
                                    <img src="/storage/{{ $party['logo_url'] }}" alt="" height="50"
                                        width="50">
                                </td>
                                <td class="party_name">{{ $party['name'] }}</td>
                                <td>
                                    <input type="number" class="vote_count form-control" id="vote_count{{ $party['id'] }}"
                                        value="0">
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="card-footer" style="padding-right: 2rem;display:flex; justify-content:end;">
                <button class="btn btn-primary" onclick="sendVotes()">KAYDET</button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            clearAll();
        });

        function clearAll() {
            document.querySelector("#case_no").value = "";
            clearVoteCounts();
        }

        function clearVoteCounts() {
            const inputs = document.querySelectorAll('.vote_count');

            inputs.forEach(input => {
                input.value = '';
            });
        }

        function sendVotes() {
            const case_no = document.querySelector("#case_no").value;

            if (!case_no) {
                alert("Sandık No olmadan devam edemezsiniz");
                return;
            }

            // Get all votes
            const votes = document.querySelectorAll('.votes');

            // Map votes to data object
            const data = Array.from(votes).map(vote => ({
                case_no,
                party_id: vote.querySelector(".party_id").innerText,
                party_name: vote.querySelector(".party_name").innerText,
                vote_count: parseInt(vote.querySelector(".vote_count").value)
            }));

            const confirmationMessage = data.reduce((t, e) => {
                return t += e.party_name + ": " + e.vote_count + "\n"
            }, "");

            if (!confirm("Aşağıdaki bilgileri onaylıyor musunuz?\n" + confirmationMessage)) return;

            // Send to API
            fetch('/api/vote_counts', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector("meta[name='csrf-token']").getAttribute("content")
                    },
                    body: JSON.stringify(data)
                })
                .then(res => res.json())
                .then(result => {
                    console.log('Data sent!', result);
                    if (result.status != "success") {
                        alert(result.message);
                    } else {
                        if (!confirm(result.message + "\nAlanlar Temizlensin Mi?")) return;
                        clearAll();
                    }
                })
                .catch(error => {
                    console.error('Error sending data:', error);
                });

        }

        /* function getVotes() {

             const case_no = document.querySelector("#case_no").value;

             // get votes from api: url= "'/api/vote_counts/{id}"

         }*/

        async function getVotes() {
            clearVoteCounts();
            const case_no = document.querySelector("#case_no").value;

            // Make request to API
            const response = await fetch(`/api/vote_counts/${case_no}`, {
                method: 'GET'
            });

            const data = await response.json();

            // Update inputs with vote data
            data.forEach(vote => {
                document.querySelector(`#vote_count${vote.party_id}`).value = vote.vote_count;
            });

        }
    </script>
@endsection
