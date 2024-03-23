<?php

namespace App\Http\Controllers;

use App\Vote;
use App\VoteCase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Home extends Controller
{
    public function browse()
    {

        $totalVoteCases = VoteCase::count();

        $totalOpenedVoteCases = count(Vote::select('case_no')->groupBy('case_no')->get());



        $totalVoteCasesRatio = floor($totalOpenedVoteCases * 100 / $totalVoteCases * 10) / 10; //->count();

        $totalVotes = Vote::sum('vote_count');

        $votes = Vote::with('party')
            ->select('party_id', DB::raw('SUM(vote_count) as vote_count'))
            ->groupBy('party_id')
            ->orderBy('vote_count', 'desc')
            //->take(2)
            ->get();

        //$votes = $votes->take(2);

        // party_id = 0 olan vote_count değerlerinin toplamını $votes içinden hesapla
        $nonvalidVoteCount = 0;
        $validVoteCount = 0;
        $selectedVotes = []; // Seçilen partilerin vote_count değerlerini tutacak dizi
        foreach ($votes as $key => $vote) {
            if ($vote->party_id == 0) {
                $nonvalidVoteCount += $vote->vote_count;
            } else {
                $validVoteCount += $vote->vote_count;
                if (count($selectedVotes) < 4) {
                    $selectedVotes[] = $vote;
                }
            }
        }
        $chartVotes = $votes->take(5);
        return view("pages.home")
            ->with("chartVotes", $chartVotes)
            ->with("selectedVotes", $selectedVotes)
            ->with("totalOpenedVoteCases", $totalOpenedVoteCases)
            ->with("totalVoteCasesRatio", $totalVoteCasesRatio)
            ->with("totalVotes", $totalVotes)
            ->with("nonvalidVoteCount", $nonvalidVoteCount)
            ->with("validVoteCount", $validVoteCount);
    }
}
