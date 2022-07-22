<?php

namespace App\Exports;

use App\Kardex;
use App\Producto;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

/*WithStyles*/
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

/**TITLE */
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\ShouldAutoSize; /**WIDTH CELL */



class ProductosExportExcel implements FromCollection,WithHeadings, WithStyles,WithTitle ,ShouldAutoSize
{   
 
    use Exportable;

    protected $kardex;


    public function __construct($kardex = null)
    {
        $this->kardex = $kardex;
    }
    
    
    /**
    * @return \Illuminate\Support\Collection
    */

    public function collection()
    {        
        return $this->kardex ?: Kardex::all();
    }


    public function headings(): array
    {
        return [
            'ID',
            'SKU',
            'PRODUCTOS',
            'STOCK',
            'EMPRESA'
            
        ];
    }



    public function styles(Worksheet $sheet)
    {

 


        $sheet->getStyle('A1:E5000')->getAlignment()->setHorizontal('center');

        //$sheet->getStyle('B2')->getFont()->setBold(true);

        return [
            // Style the first row as bold text.
            1    => ['font' => ['bold' => true]],

            // Styling a specific cell by coordinate.
            //'B2' => ['font' => ['italic' => true]],

            // Styling an entire column.
            //'C'  => ['text-align' => ['size' => 16]],
            'C'  => ['Alignment' => ['Horizontal' => 16]],
        ];
    }
 


    public function title(): string
    {
        return 'PRODUCTOS';
    }
 
}
